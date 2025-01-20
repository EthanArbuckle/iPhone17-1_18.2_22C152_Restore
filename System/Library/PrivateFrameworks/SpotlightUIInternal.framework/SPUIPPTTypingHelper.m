@interface SPUIPPTTypingHelper
- (NSString)currentQueryString;
- (NSString)queryString;
- (SPUIPPTTypingHelper)initWithString:(id)a3 viewController:(id)a4 queryKind:(unint64_t)a5 completion:(id)a6;
- (SPUISearchViewController)searchViewController;
- (double)timeSinceLastFire;
- (id)completion;
- (unint64_t)queryKind;
- (void)fire:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCurrentQueryString:(id)a3;
- (void)setQueryKind:(unint64_t)a3;
- (void)setQueryString:(id)a3;
- (void)setSearchViewController:(id)a3;
- (void)setTimeSinceLastFire:(double)a3;
@end

@implementation SPUIPPTTypingHelper

- (SPUIPPTTypingHelper)initWithString:(id)a3 viewController:(id)a4 queryKind:(unint64_t)a5 completion:(id)a6
{
  v16.receiver = self;
  v16.super_class = (Class)SPUIPPTTypingHelper;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [(SPUIPPTTypingHelper *)&v16 init];
  -[SPUIPPTTypingHelper setQueryString:](v12, "setQueryString:", v11, v16.receiver, v16.super_class);

  [(SPUIPPTTypingHelper *)v12 setCurrentQueryString:&stru_26F104E28];
  [(SPUIPPTTypingHelper *)v12 setTimeSinceLastFire:CACurrentMediaTime()];
  v13 = [MEMORY[0x263F15780] displayLinkWithTarget:v12 selector:sel_fire_];
  v14 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v13 addToRunLoop:v14 forMode:*MEMORY[0x263EFF588]];

  [(SPUIPPTTypingHelper *)v12 setSearchViewController:v10];
  [(SPUIPPTTypingHelper *)v12 setQueryKind:a5];
  [(SPUIPPTTypingHelper *)v12 setCompletion:v9];

  return v12;
}

- (void)fire:(id)a3
{
  id v20 = a3;
  double v4 = CACurrentMediaTime();
  [(SPUIPPTTypingHelper *)self timeSinceLastFire];
  v5 = v20;
  if (v4 - v6 > 0.150000006)
  {
    [(SPUIPPTTypingHelper *)self setTimeSinceLastFire:CACurrentMediaTime()];
    v7 = [(SPUIPPTTypingHelper *)self currentQueryString];
    uint64_t v8 = [v7 length] + 1;
    id v9 = [(SPUIPPTTypingHelper *)self queryString];
    uint64_t v10 = [v9 length];

    if (v8 == v10)
    {
      id v11 = [(SPUIPPTTypingHelper *)self completion];

      if (v11)
      {
        v12 = [(SPUIPPTTypingHelper *)self completion];
        v12[2]();
      }
      [v20 invalidate];
      [(SPUIPPTTypingHelper *)self setCompletion:0];
    }
    else
    {
      v13 = NSString;
      v14 = [(SPUIPPTTypingHelper *)self currentQueryString];
      v15 = [(SPUIPPTTypingHelper *)self queryString];
      objc_super v16 = [(SPUIPPTTypingHelper *)self currentQueryString];
      v17 = [v13 stringWithFormat:@"%@%c", v14, objc_msgSend(v15, "characterAtIndex:", objc_msgSend(v16, "length"))];
      [(SPUIPPTTypingHelper *)self setCurrentQueryString:v17];

      v18 = [(SPUIPPTTypingHelper *)self searchViewController];
      v19 = [(SPUIPPTTypingHelper *)self currentQueryString];
      objc_msgSend(v18, "performTestSearchWithQuery:event:queryKind:", v19, 1, -[SPUIPPTTypingHelper queryKind](self, "queryKind"));
    }
    v5 = v20;
  }
}

- (double)timeSinceLastFire
{
  return self->_timeSinceLastFire;
}

- (void)setTimeSinceLastFire:(double)a3
{
  self->_timeSinceLastFire = a3;
}

- (SPUISearchViewController)searchViewController
{
  return (SPUISearchViewController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchViewController:(id)a3
{
}

- (NSString)queryString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueryString:(id)a3
{
}

- (NSString)currentQueryString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentQueryString:(id)a3
{
}

- (unint64_t)queryKind
{
  return self->_queryKind;
}

- (void)setQueryKind:(unint64_t)a3
{
  self->_queryKind = a3;
}

- (id)completion
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_currentQueryString, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
}

@end