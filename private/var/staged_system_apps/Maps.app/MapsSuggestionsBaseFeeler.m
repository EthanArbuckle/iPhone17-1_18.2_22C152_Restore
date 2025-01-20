@interface MapsSuggestionsBaseFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (MapsSuggestionsBaseFeeler)init;
- (MapsSuggestionsBaseFeeler)initWithDelegate:(id)a3;
- (MapsSuggestionsBaseFeeler)initWithDelegate:(id)a3 name:(id)a4;
- (MapsSuggestionsFeelerDelegate)delegate;
- (NSString)description;
- (NSString)uniqueName;
- (int64_t)disposition;
- (void)setDelegate:(id)a3;
@end

@implementation MapsSuggestionsBaseFeeler

- (MapsSuggestionsBaseFeeler)initWithDelegate:(id)a3 name:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsBaseFeeler;
  v7 = [(MapsSuggestionsBaseFeeler *)&v12 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    name = v7->_name;
    v7->_name = v8;

    id v10 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_delegate, v10);
  }
  objc_destroyWeak(&location);
  return v7;
}

- (MapsSuggestionsBaseFeeler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() description];
  id v6 = [(MapsSuggestionsBaseFeeler *)self initWithDelegate:v4 name:v5];

  return v6;
}

- (MapsSuggestionsBaseFeeler)init
{
  return [(MapsSuggestionsBaseFeeler *)self initWithDelegate:0];
}

- (NSString)uniqueName
{
  return self->_name;
}

+ (BOOL)isEnabled
{
  BOOL result = [a1 doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
}

- (MapsSuggestionsFeelerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsSuggestionsFeelerDelegate *)WeakRetained;
}

- (int64_t)disposition
{
  int64_t result = (int64_t)[(MapsSuggestionsBaseFeeler *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  BOOL result = [(MapsSuggestionsBaseFeeler *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsBaseFeeler;
  id v4 = [(MapsSuggestionsBaseFeeler *)&v8 description];
  v5 = [(MapsSuggestionsBaseFeeler *)self uniqueName];
  id v6 = [v3 initWithFormat:@"%@ '%@'", v4, v5];

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end