@interface AEMinimalTemplateSet
+ (id)templateSet;
- (AEMinimalTemplateSet)init;
- (NSDictionary)templates;
- (id)evaluateTemplateWithName:(id)a3 withData:(id)a4 error:(id *)a5;
- (void)addTemplate:(id)a3 withName:(id)a4;
- (void)removeTemplateForName:(id)a3;
@end

@implementation AEMinimalTemplateSet

+ (id)templateSet
{
  v2 = objc_alloc_init(AEMinimalTemplateSet);

  return v2;
}

- (AEMinimalTemplateSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)AEMinimalTemplateSet;
  v2 = [(AEMinimalTemplateSet *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    templates = v2->_templates;
    v2->_templates = v3;
  }
  return v2;
}

- (void)addTemplate:(id)a3 withName:(id)a4
{
}

- (void)removeTemplateForName:(id)a3
{
}

- (id)evaluateTemplateWithName:(id)a3 withData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(NSMutableDictionary *)self->_templates objectForKey:v8];
  if (v10)
  {
    v11 = +[NSCountedSet set];
    a5 = [v10 evaluateWithData:v9 templateSet:self cycleContext:v11 error:a5];
  }
  else
  {
    if (!a5) {
      goto LABEL_6;
    }
    v11 = +[NSString stringWithFormat:@"No such template '%@'", v8];
    v12 = +[NSDictionary dictionaryWithObjectsAndKeys:v11, NSLocalizedDescriptionKey, v8, @"name", 0];
    *a5 = +[NSError errorWithDomain:@"AEMinimalTemplateErrorDomain" code:5 userInfo:v12];

    a5 = 0;
  }

LABEL_6:

  return a5;
}

- (NSDictionary)templates
{
  return &self->_templates->super;
}

- (void).cxx_destruct
{
}

@end