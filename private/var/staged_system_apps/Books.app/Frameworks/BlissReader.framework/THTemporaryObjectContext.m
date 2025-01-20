@interface THTemporaryObjectContext
+ (id)context;
+ (id)temporaryContextForDocumentContext:(id)a3;
- (THTemporaryObjectContext)initWithDelegate:(id)a3 documentContext:(id)a4;
- (id)documentRoot;
- (void)dealloc;
@end

@implementation THTemporaryObjectContext

+ (id)temporaryContextForDocumentContext:(id)a3
{
  objc_opt_class();
  id result = (id)TSUDynamicCast();
  if (!result)
  {
    id v6 = [objc_alloc((Class)a1) initWithDelegate:[objc_alloc((Class)TSPTemporaryObjectContextDelegate) initWithPackageURL:0] documentContext:a3];
    return v6;
  }
  return result;
}

+ (id)context
{
  return [a1 temporaryContextForDocumentContext:0];
}

- (THTemporaryObjectContext)initWithDelegate:(id)a3 documentContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THTemporaryObjectContext;
  v5 = [(THTemporaryObjectContext *)&v7 initWithDelegate:a3];
  if (v5) {
    v5->_documentContext = (TSPObjectContext *)a4;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THTemporaryObjectContext;
  [(THTemporaryObjectContext *)&v3 dealloc];
}

- (id)documentRoot
{
  return [(TSPObjectContext *)self->_documentContext documentRoot];
}

@end