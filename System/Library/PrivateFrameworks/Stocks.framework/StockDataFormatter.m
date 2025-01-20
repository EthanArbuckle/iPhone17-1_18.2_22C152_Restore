@interface StockDataFormatter
+ (id)sharedDataFormatter;
- (BOOL)doesLocaleUseASCII;
- (NSNumberFormatter)decimalFormatter;
- (NSNumberFormatter)percentFormatter;
- (NSString)percentSymbol;
- (OS_dispatch_queue)decimalFormatterQueue;
- (OS_dispatch_queue)percentFormatterQueue;
- (id)_locked_formatNumber:(id)a3 withPrecision:(unint64_t)a4 useGroupSeparator:(BOOL)a5;
- (id)_locked_formatPercent:(id)a3 withPrecision:(unint64_t)a4;
- (id)formattedChangeInPercentForStock:(id)a3;
- (id)formattedChangeInPointsForStock:(id)a3 withPrecision:(unint64_t)a4;
- (id)formattedChangeInPointsForStock:(id)a3 withPrecision:(unint64_t)a4 droppingFractionDigitsIfLengthExceeds:(unint64_t)a5;
- (id)formattedNumber:(id)a3 withPrecision:(unint64_t)a4 useGroupSeparator:(BOOL)a5;
- (id)formattedNumber:(id)a3 withPrecision:(unint64_t)a4 useGroupSeparator:(BOOL)a5 droppingFractionDigitsIfLengthExceeds:(unint64_t)a6;
- (id)formattedPercent:(id)a3;
- (id)formattedPercent:(id)a3 withPrecision:(unint64_t)a4;
- (id)formattedPriceForStock:(id)a3 withPrecision:(unint64_t)a4;
- (id)formattedPriceForStock:(id)a3 withPrecision:(unint64_t)a4 droppingFractionDigitsIfLengthExceeds:(unint64_t)a5;
- (id)initPrivate;
- (void)_resetLocale:(id)a3;
- (void)dealloc;
- (void)setDecimalFormatter:(id)a3;
- (void)setDecimalFormatterQueue:(id)a3;
- (void)setPercentFormatter:(id)a3;
- (void)setPercentFormatterQueue:(id)a3;
@end

@implementation StockDataFormatter

+ (id)sharedDataFormatter
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__StockDataFormatter_sharedDataFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDataFormatter_onceToken != -1) {
    dispatch_once(&sharedDataFormatter_onceToken, block);
  }
  v2 = (void *)sharedDataFormatter_instance;

  return v2;
}

uint64_t __41__StockDataFormatter_sharedDataFormatter__block_invoke()
{
  sharedDataFormatter_instance = [objc_alloc((Class)objc_opt_class()) initPrivate];

  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v9.receiver = self;
  v9.super_class = (Class)StockDataFormatter;
  v2 = [(StockDataFormatter *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.stocks.stock-decimal-formatter-queue", 0);
    decimalFormatterQueue = v2->_decimalFormatterQueue;
    v2->_decimalFormatterQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.stocks.stock-percent-formatter-queue", 0);
    percentFormatterQueue = v2->_percentFormatterQueue;
    v2->_percentFormatterQueue = (OS_dispatch_queue *)v5;

    [(StockDataFormatter *)v2 _resetLocale:0];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel__resetLocale_ name:*MEMORY[0x263EFF458] object:0];
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)StockDataFormatter;
  [(StockDataFormatter *)&v4 dealloc];
}

- (id)formattedChangeInPercentForStock:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [v4 change];
  [v5 floatValue];
  float v7 = v6;

  v8 = [v4 price];

  [v8 floatValue];
  float v10 = v9;

  *(float *)&double v11 = v10 - v7;
  if ((float)(v10 - v7) == 0.0)
  {
    v12 = +[Stock BlankValueString];
  }
  else
  {
    *(float *)&double v11 = fabsf(v7 / *(float *)&v11);
    v13 = [NSNumber numberWithFloat:v11];
    v12 = [(StockDataFormatter *)self formattedPercent:v13];
  }

  return v12;
}

- (id)formattedChangeInPointsForStock:(id)a3 withPrecision:(unint64_t)a4
{
  return [(StockDataFormatter *)self formattedChangeInPointsForStock:a3 withPrecision:a4 droppingFractionDigitsIfLengthExceeds:-1];
}

- (id)formattedChangeInPointsForStock:(id)a3 withPrecision:(unint64_t)a4 droppingFractionDigitsIfLengthExceeds:(unint64_t)a5
{
  v8 = [a3 change];
  [v8 floatValue];
  float v10 = v9;

  *(float *)&double v11 = fabsf(v10);
  v12 = [NSNumber numberWithFloat:v11];
  v13 = [(StockDataFormatter *)self formattedNumber:v12 withPrecision:a4 useGroupSeparator:1 droppingFractionDigitsIfLengthExceeds:a5];

  return v13;
}

- (id)formattedPriceForStock:(id)a3 withPrecision:(unint64_t)a4
{
  return [(StockDataFormatter *)self formattedPriceForStock:a3 withPrecision:a4 droppingFractionDigitsIfLengthExceeds:-1];
}

- (id)formattedPriceForStock:(id)a3 withPrecision:(unint64_t)a4 droppingFractionDigitsIfLengthExceeds:(unint64_t)a5
{
  v8 = [a3 price];
  [v8 floatValue];
  int v10 = v9;

  LODWORD(v11) = v10;
  v12 = [NSNumber numberWithFloat:v11];
  v13 = [(StockDataFormatter *)self formattedNumber:v12 withPrecision:a4 useGroupSeparator:1 droppingFractionDigitsIfLengthExceeds:a5];

  return v13;
}

- (id)formattedNumber:(id)a3 withPrecision:(unint64_t)a4 useGroupSeparator:(BOOL)a5
{
  return [(StockDataFormatter *)self formattedNumber:a3 withPrecision:a4 useGroupSeparator:a5 droppingFractionDigitsIfLengthExceeds:-1];
}

- (id)formattedNumber:(id)a3 withPrecision:(unint64_t)a4 useGroupSeparator:(BOOL)a5 droppingFractionDigitsIfLengthExceeds:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  double v11 = [(StockDataFormatter *)self decimalFormatterQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __108__StockDataFormatter_formattedNumber_withPrecision_useGroupSeparator_droppingFractionDigitsIfLengthExceeds___block_invoke;
  v15[3] = &unk_26467D0B8;
  v15[4] = self;
  id v16 = v10;
  v17 = &v21;
  unint64_t v18 = a4;
  BOOL v20 = a5;
  unint64_t v19 = a6;
  id v12 = v10;
  dispatch_sync(v11, v15);

  id v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

unint64_t __108__StockDataFormatter_formattedNumber_withPrecision_useGroupSeparator_droppingFractionDigitsIfLengthExceeds___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_locked_formatNumber:withPrecision:useGroupSeparator:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  unint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length];
  if (result > *(void *)(a1 + 64))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_locked_formatNumber:withPrecision:useGroupSeparator:", *(void *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 72));
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (id)formattedPercent:(id)a3
{
  return [(StockDataFormatter *)self formattedPercent:a3 withPrecision:2];
}

- (id)formattedPercent:(id)a3 withPrecision:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  unint64_t v18 = __Block_byref_object_copy_;
  unint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  float v7 = [(StockDataFormatter *)self percentFormatterQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__StockDataFormatter_formattedPercent_withPrecision___block_invoke;
  v11[3] = &unk_26467D0E0;
  v11[4] = self;
  id v12 = v6;
  id v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __53__StockDataFormatter_formattedPercent_withPrecision___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_locked_formatPercent:withPrecision:", *(void *)(a1 + 40), *(void *)(a1 + 56));

  return MEMORY[0x270F9A758]();
}

- (id)_locked_formatNumber:(id)a3 withPrecision:(unint64_t)a4 useGroupSeparator:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(StockDataFormatter *)self decimalFormatter];
  [v9 setMaximumFractionDigits:a4];

  id v10 = [(StockDataFormatter *)self decimalFormatter];
  [v10 setMinimumFractionDigits:a4];

  double v11 = [(StockDataFormatter *)self decimalFormatter];
  [v11 setUsesGroupingSeparator:v5];

  id v12 = [(StockDataFormatter *)self decimalFormatter];
  id v13 = [v12 stringFromNumber:v8];

  unint64_t v14 = +[StocksPreferences sharedPreferences];
  LODWORD(v12) = [v14 textAttachmentDirectionIsRightToLeft];

  if (v12)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%C%@", 8207, v13];

    id v13 = (void *)v15;
  }

  return v13;
}

- (id)_locked_formatPercent:(id)a3 withPrecision:(unint64_t)a4
{
  id v6 = a3;
  float v7 = [(StockDataFormatter *)self percentFormatter];
  [v7 setMaximumFractionDigits:a4];

  id v8 = [(StockDataFormatter *)self percentFormatter];
  [v8 setMinimumFractionDigits:a4];

  id v9 = [(StockDataFormatter *)self percentFormatter];
  id v10 = [v9 stringFromNumber:v6];

  return v10;
}

- (void)_resetLocale:(id)a3
{
  id v4 = [(StockDataFormatter *)self decimalFormatterQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__StockDataFormatter__resetLocale___block_invoke;
  block[3] = &unk_26467D130;
  block[4] = self;
  dispatch_async(v4, block);

  BOOL v5 = [(StockDataFormatter *)self percentFormatterQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__StockDataFormatter__resetLocale___block_invoke_2;
  v6[3] = &unk_26467D130;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __35__StockDataFormatter__resetLocale___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v2 setNumberStyle:1];
  [v2 setMinimumIntegerDigits:1];
  [*(id *)(a1 + 32) setDecimalFormatter:v2];

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_locked_formatNumber:withPrecision:useGroupSeparator:", &unk_26D5E8EB0, 0, 0);
  char v4 = [@"1234567890" isEqualToString:v3];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__StockDataFormatter__resetLocale___block_invoke_32;
  v5[3] = &unk_26467D108;
  v5[4] = *(void *)(a1 + 32);
  char v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __35__StockDataFormatter__resetLocale___block_invoke_32(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

void __35__StockDataFormatter__resetLocale___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v2 setNumberStyle:3];
  [v2 setMinimumIntegerDigits:1];
  [*(id *)(a1 + 32) setPercentFormatter:v2];
}

- (NSString)percentSymbol
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  double v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(StockDataFormatter *)self percentFormatterQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__StockDataFormatter_percentSymbol__block_invoke;
  v6[3] = &unk_26467D158;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __35__StockDataFormatter_percentSymbol__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) percentFormatter];
  uint64_t v2 = [v5 percentSymbol];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)doesLocaleUseASCII
{
  return self->_localeUsesASCII;
}

- (OS_dispatch_queue)decimalFormatterQueue
{
  return self->_decimalFormatterQueue;
}

- (void)setDecimalFormatterQueue:(id)a3
{
}

- (NSNumberFormatter)decimalFormatter
{
  return self->_decimalFormatter;
}

- (void)setDecimalFormatter:(id)a3
{
}

- (OS_dispatch_queue)percentFormatterQueue
{
  return self->_percentFormatterQueue;
}

- (void)setPercentFormatterQueue:(id)a3
{
}

- (NSNumberFormatter)percentFormatter
{
  return self->_percentFormatter;
}

- (void)setPercentFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentFormatter, 0);
  objc_storeStrong((id *)&self->_percentFormatterQueue, 0);
  objc_storeStrong((id *)&self->_decimalFormatter, 0);

  objc_storeStrong((id *)&self->_decimalFormatterQueue, 0);
}

@end