# ageno_flutter_assessment_skills

## Makieta aplikacji e-commerce

https://github.com/user-attachments/assets/84b29201-0f3e-40a5-a6c6-64274ce09098

Stworzyłem prostą makietę wzorowaną na sklepach e-commerce.

Po uruchomieniu aplikacji użytkownikowi ukazuje się sklep, gdzie u góry ekranu wylistowane są kategorie. Dla ułatwienia, tylko dwie pierwsze kategorie — **buty** i **t-shirty** — mają dostępne produkty.

Użytkownik może wybrać interesujący go produkt i dodać go do koszyka.  
*(Przepraszam, ale nie stworzyłem szczegółowej karty produktu).*

Po dodaniu do koszyka, użytkownik widzi na dole ekranu kwotę, którą ma zapłacić. W tym samym czasie może kontynuować zakupy w aplikacji.  
Kiedy uzna, że zakończył zakupy, wystarczy kliknąć przycisk z kwotą u dołu ekranu. Wówczas pojawia się koszyk, w którym znajdują się wszystkie wybrane przez niego produkty wraz z cenami i podsumowaniem.

Każda akcja użytkownika jest potwierdzana za pomocą pojawiających się **SnackBarów**.

---

## Tech Stack

- **Flutter (Dart)**
- **Provider** – służy do zarządzania stanem aplikacji
- **FontAwesome** – fonty i ikony używane w zakładkach
- **AnimatedContainer** – do drobnych, ale przyjemnych animacji
- **flutter_staggered_animations** – zapewnia animacje dla elementów GridView


