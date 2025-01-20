@interface PXSelectionCountNumberFormatter
- (NSNumberFormatter)decimalNumberFormatter;
- (PXSelectionCountNumberFormatter)init;
- (id)stringForObjectValue:(id)a3;
- (int64_t)selectionNumberLimit;
- (void)setSelectionNumberLimit:(int64_t)a3;
@end

@implementation PXSelectionCountNumberFormatter

- (void)setSelectionNumberLimit:(int64_t)a3
{
  self->_selectionNumberLimit = a3;
}

- (PXSelectionCountNumberFormatter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXSelectionCountNumberFormatter;
  v2 = [(PXSelectionCountNumberFormatter *)&v7 init];
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    decimalNumberFormatter = v2->_decimalNumberFormatter;
    v2->_decimalNumberFormatter = v3;

    v5 = [MEMORY[0x263EFF960] currentLocale];
    [(NSNumberFormatter *)v2->_decimalNumberFormatter setLocale:v5];

    [(NSNumberFormatter *)v2->_decimalNumberFormatter setGeneratesDecimalNumbers:1];
    [(NSNumberFormatter *)v2->_decimalNumberFormatter setNumberStyle:1];
    v2->_selectionNumberLimit = 9999;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (NSNumberFormatter)decimalNumberFormatter
{
  return self->_decimalNumberFormatter;
}

- (int64_t)selectionNumberLimit
{
  return self->_selectionNumberLimit;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = [v4 integerValue];
  }
  else {
    uint64_t v5 = 0;
  }
  int64_t v6 = [(PXSelectionCountNumberFormatter *)self selectionNumberLimit];
  objc_super v7 = [(PXSelectionCountNumberFormatter *)self decimalNumberFormatter];
  if (v5 <= v6)
  {
    v10 = [NSNumber numberWithInteger:v5];
    v12 = [v7 stringFromNumber:v10];
  }
  else
  {
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[PXSelectionCountNumberFormatter selectionNumberLimit](self, "selectionNumberLimit"));
    uint64_t v9 = [v7 stringFromNumber:v8];

    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 localizedStringForKey:@"PXSelectionNumberFormatterOverflowFormat" value:&stru_270799240 table:0];
    v12 = PFStringWithValidatedFormat();

    objc_super v7 = (void *)v9;
  }

  return v12;
}

@end