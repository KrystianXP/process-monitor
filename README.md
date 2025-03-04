# Monitor Procesów w Systemie Linux

## Opis projektu
Skrypt Bash do monitorowania procesów systemowych i zapisywania ich stanu do pliku logów. Projekt pozwala śledzić zużycie zasobów przez określone procesy oraz informować o ich statusie.

## Technologie
- **Bash** – skryptowanie
- **ps** – pobieranie informacji o procesach
- **awk** – przetwarzanie danych
- **cron (opcjonalnie)** – automatyczne uruchamianie skryptu

## Funkcjonalności
✅ Monitorowanie wybranych procesów (np. nginx, mysql, docker)  
✅ Zapisywanie danych o procesach do pliku logów  
✅ Informowanie o braku działania danego procesu  
✅ Obsługa błędów i poprawna interpretacja wyników  
✅ Możliwość uruchomienia jako zadanie cron  

## Struktura katalogów
```
/process-monitor/
│── monitor.sh  # Główny skrypt
│── logs/       # Folder z logami
│── logs/process_monitor.log  # Plik z zapisanymi danymi
```

## Instalacja i konfiguracja
1. **Sklonuj repozytorium:**
   ```bash
   git clone https://github.com/twoje-repo/process-monitor.git
   cd process-monitor
   ```

2. **Nadaj uprawnienia do wykonywania skryptu:**
   ```bash
   chmod +x monitor.sh
   ```

3. **Utwórz katalog logów:**
   ```bash
   mkdir -p logs
   ```

4. **Dodaj procesy do monitorowania w skrypcie `monitor.sh`**
   Edytuj sekcję `PROCESSES=(nginx mysql docker)` według własnych potrzeb.

5. **Uruchom skrypt:**
   ```bash
   ./monitor.sh
   ```

6. **(Opcjonalnie) Dodaj do `crontab`, aby uruchamiać co 5 minut:**
   ```bash
   crontab -e
   ```
   Dodaj linię:
   ```
   */5 * * * * /ścieżka/do/process-monitor/monitor.sh >> /ścieżka/do/process-monitor/logs/process_monitor.log 2>&1
   ```

## Format logów
Przykładowy zapis:
```
Czas | Proces  | PID  | CPU% | RAM%
2025-03-04 19:50:03 | nginx | 1234 | 2.3 | 15.2
2025-03-04 19:50:03 | mysql | 5678 | 4.1 | 32.8
2025-03-04 19:50:03 | docker | 9101 | 1.0 | 5.4
```
Jeśli proces nie działa:
```
2025-03-04 20:00:05 | nginx | Not Running
```

## Podsumowanie
🔹 Monitorowanie procesów systemowych  
🔹 Logowanie wykorzystania CPU i RAM  
🔹 Powiadomienie o zatrzymaniu procesów  
🔹 Możliwość automatyzacji przez `cron`  

## Idealne do podstawowego monitoringu systemowego!**

