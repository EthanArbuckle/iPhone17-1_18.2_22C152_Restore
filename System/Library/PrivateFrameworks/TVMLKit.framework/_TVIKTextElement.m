@interface _TVIKTextElement
- (NSAttributedString)cachedAttributedString;
- (void)_stylesMarkedDirtyNotification:(id)a3;
- (void)dealloc;
- (void)setCachedAttributedString:(id)a3;
@end

@implementation _TVIKTextElement

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_TVIKTextElement;
  [(_TVIKTextElement *)&v4 dealloc];
}

- (void)setCachedAttributedString:(id)a3
{
  objc_super v4 = (NSAttributedString *)[a3 copy];
  cachedAttributedString = self->_cachedAttributedString;
  self->_cachedAttributedString = v4;

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:@"TVAppDocumentDidMarkStylesDirtyNotification" object:0];

  if (self->_cachedAttributedString)
  {
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    v7 = [(_TVIKTextElement *)self appDocument];
    [v8 addObserver:self selector:sel__stylesMarkedDirtyNotification_ name:@"TVAppDocumentDidMarkStylesDirtyNotification" object:v7];
  }
}

- (void)_stylesMarkedDirtyNotification:(id)a3
{
  if ([(_TVIKTextElement *)self updateType] == 2
    || [(_TVIKTextElement *)self updateType] == 4)
  {
    [(_TVIKTextElement *)self setCachedAttributedString:0];
  }
}

- (NSAttributedString)cachedAttributedString
{
  return self->_cachedAttributedString;
}

- (void).cxx_destruct
{
}

@end