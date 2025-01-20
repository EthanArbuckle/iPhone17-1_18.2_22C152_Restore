@interface PLFilePathDescription
+ (id)descriptionWithFileURL:(id)a3;
+ (id)descriptionWithPath:(id)a3;
- (PLFilePathDescription)init;
- (PLFilePathDescription)initWithPath:(id)a3;
- (id)description;
- (id)redactedDescription;
@end

@implementation PLFilePathDescription

- (void).cxx_destruct
{
}

- (id)redactedDescription
{
  if (self->_path)
  {
    v2 = +[PLFileUtilities redactedDescriptionForPath:](PLFileUtilities, "redactedDescriptionForPath:");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)description
{
  return self->_path;
}

- (PLFilePathDescription)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLFilePathDescription;
  v5 = [(PLFilePathDescription *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (PLFilePathDescription)init
{
  return [(PLFilePathDescription *)self initWithPath:0];
}

+ (id)descriptionWithFileURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = [v4 path];

  v7 = (void *)[v5 initWithPath:v6];
  return v7;
}

+ (id)descriptionWithPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithPath:v4];

  return v5;
}

@end