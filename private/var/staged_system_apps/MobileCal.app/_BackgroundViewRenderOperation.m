@interface _BackgroundViewRenderOperation
- (MonthWeekOccurrencesView)view;
- (_BackgroundViewRenderOperation)initWithView:(id)a3 views:(id)a4 bounds:(CGRect)a5 traitCollection:(id)a6;
- (void)main;
@end

@implementation _BackgroundViewRenderOperation

- (_BackgroundViewRenderOperation)initWithView:(id)a3 views:(id)a4 bounds:(CGRect)a5 traitCollection:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_BackgroundViewRenderOperation;
  v17 = [(_BackgroundViewRenderOperation *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_view, a3);
    objc_storeStrong((id *)&v18->_views, a4);
    v18->_bounds.origin.CGFloat x = x;
    v18->_bounds.origin.CGFloat y = y;
    v18->_bounds.size.CGFloat width = width;
    v18->_bounds.size.CGFloat height = height;
    objc_storeStrong((id *)&v18->_traits, a6);
  }

  return v18;
}

- (void)main
{
  v3 = self->_views;
  objc_sync_enter(v3);
  [(NSMutableSet *)self->_views removeObject:self->_view];
  objc_sync_exit(v3);

  if (([(_BackgroundViewRenderOperation *)self isCancelled] & 1) == 0)
  {
    v4 = [(_BackgroundViewRenderOperation *)self view];
    if ([v4 hasOccurrences])
    {
    }
    else
    {
      v5 = [(_BackgroundViewRenderOperation *)self view];
      unsigned int v6 = [v5 hasDrawnBefore];

      if (!v6) {
        return;
      }
    }
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = sub_10005F208;
    v10[4] = sub_10005F218;
    id v11 = 0;
    traits = self->_traits;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100063E48;
    v9[3] = &unk_1001D3260;
    v9[4] = self;
    v9[5] = v10;
    [(UITraitCollection *)traits performAsCurrentTraitCollection:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100063F94;
    v8[3] = &unk_1001D3260;
    v8[4] = self;
    v8[5] = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    _Block_object_dispose(v10, 8);
  }
}

- (MonthWeekOccurrencesView)view
{
  return (MonthWeekOccurrencesView *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_traits, 0);

  objc_storeStrong((id *)&self->_views, 0);
}

@end