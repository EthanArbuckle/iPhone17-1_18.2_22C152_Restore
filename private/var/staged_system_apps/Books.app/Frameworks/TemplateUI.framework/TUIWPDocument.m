@interface TUIWPDocument
- (TSSStylesheet)stylesheet;
- (TUIWPDocument)init;
- (TUIWPDocument)initWithContext:(id)a3;
@end

@implementation TUIWPDocument

- (TUIWPDocument)init
{
  v3 = +[TUIWPTemporaryObjectContext temporaryObjectContext];
  v4 = [(TUIWPDocument *)self initWithContext:v3];

  return v4;
}

- (TUIWPDocument)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIWPDocument;
  v5 = [(TUIWPDocument *)&v9 initWithContext:v4];
  if (v5)
  {
    v6 = (TSSStylesheet *)[objc_alloc((Class)TSSStylesheet) initWithContext:v4];
    stylesheet = v5->_stylesheet;
    v5->_stylesheet = v6;

    [(TUIWPDocument *)v5 documentDidLoad];
  }

  return v5;
}

- (TSSStylesheet)stylesheet
{
  return self->_stylesheet;
}

- (void).cxx_destruct
{
}

@end