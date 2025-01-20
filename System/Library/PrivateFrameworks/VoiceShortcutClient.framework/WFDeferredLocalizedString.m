@interface WFDeferredLocalizedString
- (NSString)backingStore;
- (NSString)localizedValue;
- (WFDeferredLocalizedString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (_NSLocalizedStringResource)stringResource;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)setBackingStore:(id)a3;
- (void)setLocalizedValue:(id)a3;
- (void)setStringResource:(id)a3;
@end

@implementation WFDeferredLocalizedString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_stringResource, 0);
  objc_storeStrong((id *)&self->_localizedValue, 0);
}

- (void)setBackingStore:(id)a3
{
}

- (NSString)backingStore
{
  return self->_backingStore;
}

- (void)setStringResource:(id)a3
{
}

- (_NSLocalizedStringResource)stringResource
{
  return self->_stringResource;
}

- (void)setLocalizedValue:(id)a3
{
}

- (NSString)localizedValue
{
  return self->_localizedValue;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[WFDeferredLocalizedString alloc] initWithString:self];
  v5 = [(WFDeferredLocalizedString *)self localizedValue];
  [(WFDeferredLocalizedString *)v4 setLocalizedValue:v5];

  v6 = [(WFDeferredLocalizedString *)self stringResource];
  [(WFDeferredLocalizedString *)v4 setStringResource:v6];

  return v4;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  v4 = [(WFDeferredLocalizedString *)self backingStore];
  LOWORD(a3) = [v4 characterAtIndex:a3];

  return a3;
}

- (unint64_t)length
{
  v2 = [(WFDeferredLocalizedString *)self backingStore];
  unint64_t v3 = [v2 length];

  return v3;
}

- (WFDeferredLocalizedString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)WFDeferredLocalizedString;
  v8 = [(WFDeferredLocalizedString *)&v12 init];
  if (v8)
  {
    v9 = (void *)[[NSString alloc] initWithCharactersNoCopy:a3 length:a4 freeWhenDone:v5];
    [(WFDeferredLocalizedString *)v8 setBackingStore:v9];

    v10 = v8;
  }

  return v8;
}

@end