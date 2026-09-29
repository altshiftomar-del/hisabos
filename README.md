<div align="center">

# HISABOS

_Personal Finance Manager with Khatabook-style Party Ledger_

![version](https://img.shields.io/badge/version-1.0.0-blue) ![dart](https://img.shields.io/badge/dart-100%25-blue) ![license](https://img.shields.io/badge/license-MIT-green) ![flutter](https://img.shields.io/badge/flutter-3.19-blue)

_Built with:_
![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white) ![Provider](https://img.shields.io/badge/Provider-FF6B6B?logo=flutter) ![SQLite](https://img.shields.io/badge/SQLite-003B57?logo=sqlite&logoColor=white) ![Material Design](https://img.shields.io/badge/Material%20Design-757575?logo=material-design)

</div>

---

## Overview

**HisabOS** (হিসাবওএস) is a personal finance and ledger management app built with **Flutter**. It combines:

- a **daily spending tracker** for your own expenses, and
- a **Khatabook-style party ledger** (খাতাবই) for tracking who you will give / who you will get money from.

Designed for **Bangladesh/India context** — offline-first, local SQLite storage, no internet required.

---

## Features

- 📊 **Daily/Weekly/Monthly/Yearly Views** — Track spending across time ranges
- 💰 **Category-Based Transactions** — Title, amount, date, category
- 👥 **Khatabook Party Ledger** — Create parties, track "gave/got" transactions
- 📈 **Auto Balance Calculation** — "You will give" / "You will get" totals
- 🎨 **Modern Material 3 UI** — Custom fonts (OpenSans, Quicksand), color-coded
- 📊 **Visual Analytics** — Charts via `fl_chart`
- 💾 **Offline Storage** — SQLite (`spendings.db`, `khatabook.db`)
- 🔄 **Real-Time Updates** — Provider state management

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Flutter 3.x |
| Language | Dart 3.x |
| State Mgmt | Provider |
| Database | SQLite (sqflite) |
| Charts | fl_chart |
| Utils | intl, random_color, url_launcher |

---

## Getting Started

### For Users (Android)

1. Download latest APK from [Releases](https://github.com/altshiftomar-del/hisabos/releases/latest)
2. Enable "Install from Unknown Sources" in Android settings
3. Install APK and start tracking! 🎉

**Requirements:** Android 5.0+, ~20 MB storage

---

### For Developers

```bash
# 1. Clone
git clone https://github.com/altshiftomar-del/hisabos.git
cd hisabos

# 2. Install deps
flutter pub get

# 3. Run
flutter run

# 4. Build APK
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

---

## Architecture

```
lib/
├── main.dart                 # App entry, theme, routes
├── models/                   # Data models
│   ├── transaction.dart      # Personal spending
│   ├── pie_data.dart         # Chart data
│   ├── party.dart            # Party contact
│   └── transaction_model.dart # Party ledger transaction
├── constants/
│   └── categories.dart       # Expense categories
├── database/
│   └── db_helper.dart        # SQLite (khatabook.db)
├── DBhelp/
│   └── dbhelper.dart         # SQLite (spendings.db)
├── screens/
│   ├── home_screen.dart      # Main dashboard
│   ├── new_transaction.dart  # Add expense
│   ├── party_list_screen.dart # Party ledger list
│   ├── party_profile_screen.dart # Party detail
│   ├── transaction_detail_screen.dart
│   ├── add_party_screen.dart
│   ├── statistics/           # Charts (pie, weekly, yearly)
│   └── transactions/         # Daily/weekly/monthly/yearly lists
└── widgets/                  # Reusable UI components
```

---

## Data Models

### Personal Spending (`Transaction`)
- `id`, `title`, `amount`, `date`, `category`

### Party Ledger (`Party`, `TransactionModel`)
- **Party**: `id`, `name`, `phone`
- **TransactionModel**: `partyId`, `amount`, `type (gave/got)`, `date`, `note`

---

## License

MIT License — see [LICENSE](LICENSE)

---

## Credits

- Based on [BudgetBudy](https://github.com/devaldaki3/BudgetBudy) by [@devaldaki3](https://github.com/devaldaki3) (MIT)
- Developed with ❤️ for the Bengali finance community

---

## Support

- ⭐ Star this repo
- 🐛 [Report issues](https://github.com/altshiftomar-del/hisabos/issues)
- 💬 [Discussions](https://github.com/altshiftomar-del/hisabos/discussions)