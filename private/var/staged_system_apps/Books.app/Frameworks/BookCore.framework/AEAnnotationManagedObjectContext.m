@interface AEAnnotationManagedObjectContext
- (AEAnnotationManagedObjectContext)initWithConcurrencyType:(unint64_t)a3;
- (AEAnnotationProvider)annotationProvider;
- (BOOL)saveAnnotationProvider;
- (int)sessionContextType;
- (void)setAnnotationProvider:(id)a3;
- (void)setSessionContextType:(int)a3;
@end

@implementation AEAnnotationManagedObjectContext

- (AEAnnotationManagedObjectContext)initWithConcurrencyType:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AEAnnotationManagedObjectContext;
  return [(AEAnnotationManagedObjectContext *)&v4 initWithConcurrencyType:a3];
}

- (BOOL)saveAnnotationProvider
{
  v2 = self;
  v3 = [(AEAnnotationManagedObjectContext *)self annotationProvider];
  LOBYTE(v2) = [v3 saveManagedObjectContext:v2];

  return (char)v2;
}

- (int)sessionContextType
{
  return self->_sessionContextType;
}

- (void)setSessionContextType:(int)a3
{
  self->_sessionContextType = a3;
}

- (AEAnnotationProvider)annotationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationProvider);

  return (AEAnnotationProvider *)WeakRetained;
}

- (void)setAnnotationProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end