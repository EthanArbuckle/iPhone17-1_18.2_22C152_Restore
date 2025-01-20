@interface PXSymbolBadgeView
- (PXSymbolBadgeView)initWithIndex:(id)a3;
- (id)symbolForIndex:(id)a3;
- (void)setIndex:(id)a3;
@end

@implementation PXSymbolBadgeView

- (id)symbolForIndex:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (symbolForIndex__onceToken != -1) {
      dispatch_once(&symbolForIndex__onceToken, &__block_literal_global_284031);
    }
    unint64_t v4 = [v3 unsignedIntegerValue];
    unint64_t v5 = [(id)symbolForIndex__sSymbols count];
    v6 = [(id)symbolForIndex__sSymbols objectAtIndexedSubscript:v4 % v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __36__PXSymbolBadgeView_symbolForIndex___block_invoke()
{
  v0 = (void *)symbolForIndex__sSymbols;
  symbolForIndex__sSymbols = (uint64_t)&unk_1F02D5620;
}

- (void)setIndex:(id)a3
{
  id v4 = [(PXSymbolBadgeView *)self symbolForIndex:a3];
  [(PXTextSymbolView *)self setSymbol:v4];
}

- (PXSymbolBadgeView)initWithIndex:(id)a3
{
  id v4 = [(PXSymbolBadgeView *)self symbolForIndex:a3];
  v7.receiver = self;
  v7.super_class = (Class)PXSymbolBadgeView;
  unint64_t v5 = [(PXTextSymbolView *)&v7 initWithSymbol:v4];

  return v5;
}

@end