@interface SiriSharedUICompactResultPlatterViewController
- (NSArray)siriContentViewControllers;
- (void)setSiriContentViewControllers:(id)a3;
@end

@implementation SiriSharedUICompactResultPlatterViewController

- (void)setSiriContentViewControllers:(id)a3
{
  v5 = (NSArray *)a3;
  p_siriContentViewControllers = &self->_siriContentViewControllers;
  if (self->_siriContentViewControllers != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_siriContentViewControllers, a3);
    v7 = objc_opt_new();
    if ([(NSArray *)*p_siriContentViewControllers count])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [(NSArray *)v12 objectAtIndex:v8];
        v10 = [(NSArray *)v12 lastObject];

        [v7 addObject:v9];
        ++v8;
        if (v9 != v10)
        {
          v11 = [(NSArray *)v12 objectAtIndex:v8];
          [(SiriSharedUIContentPlatterViewController *)self appendSeparatorToViewControllers:v7 forNextViewController:v11];
        }
      }
      while ([(NSArray *)*p_siriContentViewControllers count] > v8);
    }
    [(SiriSharedUIContentPlatterViewController *)self setContentViewControllers:v7];

    v5 = v12;
  }
}

- (NSArray)siriContentViewControllers
{
  return self->_siriContentViewControllers;
}

- (void).cxx_destruct
{
}

@end