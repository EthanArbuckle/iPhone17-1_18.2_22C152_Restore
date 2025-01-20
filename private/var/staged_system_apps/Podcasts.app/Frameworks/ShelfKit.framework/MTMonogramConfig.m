@interface MTMonogramConfig
+ (id)monogramWithURL:(id)a3;
- (CGSize)size;
- (MTMonogramConfig)initWithURL:(id)a3;
- (NSString)formattedValue;
- (NSString)value;
- (double)floatForKey:(id)a3 fromURL:(id)a4;
- (double)heightFromURL:(id)a3;
- (double)widthFromURL:(id)a3;
- (id)initalsFromURL:(id)a3;
- (id)nameFromURL:(id)a3;
- (id)numberFormatter;
- (id)valueForKey:(id)a3 fromURL:(id)a4;
- (int64_t)type;
- (void)setSize:(CGSize)a3;
- (void)setType:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation MTMonogramConfig

+ (id)monogramWithURL:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithURL:v3];

  return v4;
}

- (MTMonogramConfig)initWithURL:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MTMonogramConfig;
  v5 = [(MTMonogramConfig *)&v21 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  v7 = [(MTMonogramConfig *)v5 initalsFromURL:v4];
  if (v7)
  {
    [(MTMonogramConfig *)v6 setValue:v7];
    uint64_t v8 = 1;
  }
  else
  {
    v9 = [(MTMonogramConfig *)v6 nameFromURL:v4];
    [(MTMonogramConfig *)v6 setValue:v9];

    uint64_t v8 = 0;
  }
  [(MTMonogramConfig *)v6 setType:v8];
  [(MTMonogramConfig *)v6 widthFromURL:v4];
  double v11 = v10;
  [(MTMonogramConfig *)v6 heightFromURL:v4];
  -[MTMonogramConfig setSize:](v6, "setSize:", v11, v12);
  uint64_t v13 = [(MTMonogramConfig *)v6 value];
  if (!v13) {
    goto LABEL_11;
  }
  v14 = (void *)v13;
  v15 = [(MTMonogramConfig *)v6 value];
  if (![v15 length] || (-[MTMonogramConfig size](v6, "size"), v16 <= 0.0))
  {

LABEL_11:
    goto LABEL_12;
  }
  [(MTMonogramConfig *)v6 size];
  double v18 = v17;

  if (v18 <= 0.0)
  {
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
LABEL_9:
  v19 = v6;
LABEL_13:

  return v19;
}

- (id)initalsFromURL:(id)a3
{
  return [(MTMonogramConfig *)self valueForKey:@"initials" fromURL:a3];
}

- (id)nameFromURL:(id)a3
{
  return [(MTMonogramConfig *)self valueForKey:@"name" fromURL:a3];
}

- (double)widthFromURL:(id)a3
{
  [(MTMonogramConfig *)self floatForKey:@"width" fromURL:a3];
  return result;
}

- (double)heightFromURL:(id)a3
{
  [(MTMonogramConfig *)self floatForKey:@"height" fromURL:a3];
  return result;
}

- (double)floatForKey:(id)a3 fromURL:(id)a4
{
  v5 = [(MTMonogramConfig *)self valueForKey:a3 fromURL:a4];
  v6 = [(MTMonogramConfig *)self numberFormatter];
  v7 = [v6 numberFromString:v5];
  [v7 doubleValue];
  if (v8 == 0.0) {
    double v9 = 0.0;
  }
  else {
    double v9 = v8;
  }

  return v9;
}

- (id)valueForKey:(id)a3 fromURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSURLComponents) initWithURL:v6 resolvingAgainstBaseURL:0];
  double v8 = +[NSMutableDictionary dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v9 = [v7 queryItems];
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v15 = [v14 value];
        double v16 = [v14 name];
        [v8 setObject:v15 forKeyedSubscript:v16];
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  double v17 = [v8 objectForKeyedSubscript:v5];

  return v17;
}

- (id)numberFormatter
{
  if (numberFormatter_onceToken != -1) {
    dispatch_once(&numberFormatter_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)numberFormatter_fmt;

  return v2;
}

void __35__MTMonogramConfig_numberFormatter__block_invoke(id a1)
{
  numberFormatter_fmt = objc_opt_new();

  _objc_release_x1();
}

- (NSString)formattedValue
{
  if ([(MTMonogramConfig *)self type])
  {
    id v3 = [(MTMonogramConfig *)self value];
  }
  else
  {
    id v4 = [(MTMonogramConfig *)self value];
    id v5 = +[CNContact contactWithDisplayName:v4 emailOrPhoneNumber:0];

    id v3 = +[CNContactFormatter stringFromContact:v5 style:1002];
  }

  return (NSString *)v3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end