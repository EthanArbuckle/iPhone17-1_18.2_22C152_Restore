@interface PLDateRangeTitleGenerator
- (PLDateRangeTitleGenerator)init;
- (PLDateRangeTitleGenerator)initWithLocale:(id)a3;
- (id)dateRangeFormatter;
- (id)dateRangeFormatterForCategory:(unsigned __int16)a3 kind:(unsigned __int16)a4 type:(unsigned __int16)a5 options:(unint64_t)a6;
- (id)dateRangeTitleWithStartDate:(id)a3 endDate:(id)a4 category:(unsigned __int16)a5 kind:(unsigned __int16)a6 type:(unsigned __int16)a7;
- (id)dateRangeTitleWithStartDate:(id)a3 endDate:(id)a4 category:(unsigned __int16)a5 kind:(unsigned __int16)a6 type:(unsigned __int16)a7 options:(unint64_t)a8;
- (id)monthYearWithDelimiterDateRangeFormatter;
- (id)newDateRangeFormatter;
- (id)newMonthYearWithDelimiterDateRangeFormatter;
- (id)newRecentDateRangeFormatter;
- (id)newShortMonthYearDateRangeFormatter;
- (id)newShortMonthYearWithDelimiterDateRangeFormatter;
- (id)newYearDateRangeFormatter;
- (id)newYearlessDateRangeFormatter;
- (id)recentDateRangeFormatter;
- (id)shortMonthYearDateRangeFormatter;
- (id)shortMonthYearWithDelimiterDateRangeFormatter;
- (id)yearDateRangeFormatter;
- (id)yearlessDateRangeFormatter;
@end

@implementation PLDateRangeTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lazyYearDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyShortMonthYearDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyShortMonthYearWithDelimiterDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyMonthYearWithDelimiterDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyYearlessDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyDateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_lazyRecentDateRangeFormatter, 0);
}

- (id)yearDateRangeFormatter
{
  return (id)[(PLLazyObject *)self->_lazyYearDateRangeFormatter objectValue];
}

- (id)shortMonthYearDateRangeFormatter
{
  return (id)[(PLLazyObject *)self->_lazyShortMonthYearDateRangeFormatter objectValue];
}

- (id)shortMonthYearWithDelimiterDateRangeFormatter
{
  return (id)[(PLLazyObject *)self->_lazyShortMonthYearWithDelimiterDateRangeFormatter objectValue];
}

- (id)monthYearWithDelimiterDateRangeFormatter
{
  return (id)[(PLLazyObject *)self->_lazyMonthYearWithDelimiterDateRangeFormatter objectValue];
}

- (id)yearlessDateRangeFormatter
{
  return (id)[(PLLazyObject *)self->_lazyYearlessDateRangeFormatter objectValue];
}

- (id)dateRangeFormatter
{
  return (id)[(PLLazyObject *)self->_lazyDateRangeFormatter objectValue];
}

- (id)recentDateRangeFormatter
{
  return (id)[(PLLazyObject *)self->_lazyRecentDateRangeFormatter objectValue];
}

- (id)newYearDateRangeFormatter
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = [[PLDateRangeFormatter alloc] initWithPreset:4];
  v5 = v4;
  if (self->_locale) {
    -[PLDateRangeFormatter setLocale:](v4, "setLocale:");
  }
  return v5;
}

- (id)newShortMonthYearDateRangeFormatter
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = [[PLDateRangeFormatter alloc] initWithPreset:10];
  v5 = v4;
  if (self->_locale) {
    -[PLDateRangeFormatter setLocale:](v4, "setLocale:");
  }
  return v5;
}

- (id)newShortMonthYearWithDelimiterDateRangeFormatter
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = [[PLDateRangeFormatter alloc] initWithPreset:9];
  v5 = v4;
  if (self->_locale) {
    -[PLDateRangeFormatter setLocale:](v4, "setLocale:");
  }
  return v5;
}

- (id)newMonthYearWithDelimiterDateRangeFormatter
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = [[PLDateRangeFormatter alloc] initWithPreset:8];
  v5 = v4;
  if (self->_locale) {
    -[PLDateRangeFormatter setLocale:](v4, "setLocale:");
  }
  return v5;
}

- (id)newYearlessDateRangeFormatter
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = +[PLDateRangeFormatter autoupdatingFormatterWithPreset:1];
  [v4 setUseLocalDates:1];
  if (self->_locale) {
    objc_msgSend(v4, "setLocale:");
  }
  return v4;
}

- (id)newDateRangeFormatter
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = +[PLDateRangeFormatter autoupdatingFormatterWithPreset:0];
  [v4 setUseLocalDates:1];
  if (self->_locale) {
    objc_msgSend(v4, "setLocale:");
  }
  return v4;
}

- (id)newRecentDateRangeFormatter
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = +[PLDateRangeFormatter autoupdatingFormatterWithPreset:2];
  [v4 setUseLocalDates:1];
  if (self->_locale) {
    objc_msgSend(v4, "setLocale:");
  }
  return v4;
}

- (id)dateRangeFormatterForCategory:(unsigned __int16)a3 kind:(unsigned __int16)a4 type:(unsigned __int16)a5 options:(unint64_t)a6
{
  switch(a4)
  {
    case 0u:
    case 3u:
      if ((a6 & 0x10) != 0)
      {
        v8 = [(PLDateRangeTitleGenerator *)self shortMonthYearDateRangeFormatter];
        goto LABEL_18;
      }
      if (a3 == 1)
      {
        v8 = [(PLDateRangeTitleGenerator *)self recentDateRangeFormatter];
        goto LABEL_18;
      }
      if (a3) {
        goto LABEL_8;
      }
      if ((a6 & 2) != 0) {
        [(PLDateRangeTitleGenerator *)self yearlessDateRangeFormatter];
      }
      else {
        [(PLDateRangeTitleGenerator *)self dateRangeFormatter];
      }
      goto LABEL_7;
    case 1u:
LABEL_8:
      if ((a6 & 4) != 0) {
        [(PLDateRangeTitleGenerator *)self shortMonthYearWithDelimiterDateRangeFormatter];
      }
      else {
        [(PLDateRangeTitleGenerator *)self monthYearWithDelimiterDateRangeFormatter];
      }
      v8 = LABEL_7:;
      goto LABEL_18;
    case 2u:
      v8 = [(PLDateRangeTitleGenerator *)self yearDateRangeFormatter];
LABEL_18:
      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

- (id)dateRangeTitleWithStartDate:(id)a3 endDate:(id)a4 category:(unsigned __int16)a5 kind:(unsigned __int16)a6 type:(unsigned __int16)a7 options:(unint64_t)a8
{
  uint64_t v9 = a7;
  uint64_t v10 = a6;
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  v16 = v15;
  v17 = 0;
  if (v14 && v15)
  {
    v18 = [(PLDateRangeTitleGenerator *)self dateRangeFormatterForCategory:v11 kind:v10 type:v9 options:a8];
    v19 = v18;
    if (v18)
    {
      [v18 setAllowUseTime:(a8 & 8) == 0];
      [v19 setAllowUseRelativeDayFormatting:(v9 > 4) | (9u >> v9) & 1];
      if (a8)
      {
        v20 = [MEMORY[0x1E4F1CA20] currentLocale];
        [v19 setLocale:v20];
      }
      if (v10 >= 2) {
        id v21 = v16;
      }
      else {
        id v21 = v14;
      }
      v17 = [v19 stringFromDate:v14 toDate:v21];
    }
    else
    {
      v17 = 0;
    }
  }
  return v17;
}

- (id)dateRangeTitleWithStartDate:(id)a3 endDate:(id)a4 category:(unsigned __int16)a5 kind:(unsigned __int16)a6 type:(unsigned __int16)a7
{
  return [(PLDateRangeTitleGenerator *)self dateRangeTitleWithStartDate:a3 endDate:a4 category:a5 kind:a6 type:a7 options:0];
}

- (PLDateRangeTitleGenerator)initWithLocale:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PLDateRangeTitleGenerator *)self init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_locale, a3);
  }

  return v7;
}

- (PLDateRangeTitleGenerator)init
{
  v47.receiver = self;
  v47.super_class = (Class)PLDateRangeTitleGenerator;
  v2 = [(PLDateRangeTitleGenerator *)&v47 init];
  if (v2)
  {
    id v3 = objc_initWeak(&location, v2);

    id v4 = objc_alloc(MEMORY[0x1E4F8B948]);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __33__PLDateRangeTitleGenerator_init__block_invoke;
    v44[3] = &unk_1E5874070;
    objc_copyWeak(&v45, &location);
    uint64_t v5 = [v4 initWithBlock:v44];
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    lazyRecentDateRangeFormatter = v2->_lazyRecentDateRangeFormatter;
    v2->_lazyRecentDateRangeFormatter = (PLLazyObject *)v5;

    id v7 = objc_initWeak(&location, v2);
    id v8 = objc_alloc(MEMORY[0x1E4F8B948]);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_2;
    v42[3] = &unk_1E5874070;
    objc_copyWeak(&v43, &location);
    uint64_t v9 = [v8 initWithBlock:v42];
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
    lazyDateRangeFormatter = v2->_lazyDateRangeFormatter;
    v2->_lazyDateRangeFormatter = (PLLazyObject *)v9;

    id v11 = objc_initWeak(&location, v2);
    id v12 = objc_alloc(MEMORY[0x1E4F8B948]);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_3;
    v40[3] = &unk_1E5874070;
    objc_copyWeak(&v41, &location);
    uint64_t v13 = [v12 initWithBlock:v40];
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
    lazyYearlessDateRangeFormatter = v2->_lazyYearlessDateRangeFormatter;
    v2->_lazyYearlessDateRangeFormatter = (PLLazyObject *)v13;

    id v15 = objc_initWeak(&location, v2);
    id v16 = objc_alloc(MEMORY[0x1E4F8B948]);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_4;
    v38[3] = &unk_1E5874070;
    objc_copyWeak(&v39, &location);
    uint64_t v17 = [v16 initWithBlock:v38];
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
    lazyMonthYearWithDelimiterDateRangeFormatter = v2->_lazyMonthYearWithDelimiterDateRangeFormatter;
    v2->_lazyMonthYearWithDelimiterDateRangeFormatter = (PLLazyObject *)v17;

    id v19 = objc_initWeak(&location, v2);
    id v20 = objc_alloc(MEMORY[0x1E4F8B948]);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_5;
    v36[3] = &unk_1E5874070;
    objc_copyWeak(&v37, &location);
    uint64_t v21 = [v20 initWithBlock:v36];
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
    lazyShortMonthYearWithDelimiterDateRangeFormatter = v2->_lazyShortMonthYearWithDelimiterDateRangeFormatter;
    v2->_lazyShortMonthYearWithDelimiterDateRangeFormatter = (PLLazyObject *)v21;

    id v23 = objc_initWeak(&location, v2);
    id v24 = objc_alloc(MEMORY[0x1E4F8B948]);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_6;
    v34[3] = &unk_1E5874070;
    objc_copyWeak(&v35, &location);
    uint64_t v25 = [v24 initWithBlock:v34];
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
    lazyShortMonthYearDateRangeFormatter = v2->_lazyShortMonthYearDateRangeFormatter;
    v2->_lazyShortMonthYearDateRangeFormatter = (PLLazyObject *)v25;

    id v27 = objc_initWeak(&location, v2);
    id v28 = objc_alloc(MEMORY[0x1E4F8B948]);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __33__PLDateRangeTitleGenerator_init__block_invoke_7;
    v32[3] = &unk_1E5874070;
    objc_copyWeak(&v33, &location);
    uint64_t v29 = [v28 initWithBlock:v32];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    lazyYearDateRangeFormatter = v2->_lazyYearDateRangeFormatter;
    v2->_lazyYearDateRangeFormatter = (PLLazyObject *)v29;
  }
  return v2;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newRecentDateRangeFormatter];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newDateRangeFormatter];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newYearlessDateRangeFormatter];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newMonthYearWithDelimiterDateRangeFormatter];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newShortMonthYearWithDelimiterDateRangeFormatter];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newShortMonthYearDateRangeFormatter];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id __33__PLDateRangeTitleGenerator_init__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = (void *)[WeakRetained newYearDateRangeFormatter];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

@end