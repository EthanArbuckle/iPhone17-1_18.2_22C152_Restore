@interface IMViewState
+ (id)saveStateForView:(id)a3 flags:(unint64_t)a4;
- (IMViewState)initWithView:(id)a3 flags:(unint64_t)flags;
- (void)dealloc;
- (void)restore;
@end

@implementation IMViewState

+ (id)saveStateForView:(id)a3 flags:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithView:v6 flags:a4];

  return v7;
}

- (IMViewState)initWithView:(id)a3 flags:(unint64_t)flags
{
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IMViewState;
  v8 = [(IMViewState *)&v24 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v8->_view, a3);
  v9->_flags = flags;
  if (flags)
  {
    v11 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    placeholderView = v9->_placeholderView;
    v9->_placeholderView = v11;

    v13 = [v7 superview];
    [v13 insertSubview:v9->_placeholderView belowSubview:v9->_view];

    flags = v9->_flags;
    if ((flags & 4) == 0)
    {
LABEL_4:
      if ((flags & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_4;
  }
  view = v9->_view;
  if (view)
  {
    [(UIView *)view transform];
    flags = v9->_flags;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
  }
  *(_OWORD *)&v9->_transform.a = v21;
  *(_OWORD *)&v9->_transform.c = v22;
  *(_OWORD *)&v9->_transform.tx = v23;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  [(UIView *)v9->_view frame];
  v9->_frame.origin.x = v15;
  v9->_frame.origin.y = v16;
  v9->_frame.size.width = v17;
  v9->_frame.size.height = v18;
  flags = v9->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
LABEL_17:
    v9->_autoresizingMask = [(UIView *)v9->_view autoresizingMask];
    if ((v9->_flags & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_16:
  v19 = [(UIView *)v9->_view layer];
  [v19 zPosition];
  v9->_zPosition = v20;

  flags = v9->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_17;
  }
LABEL_7:
  if ((flags & 0x20) != 0) {
LABEL_8:
  }
    v9->_hidden = [(UIView *)v9->_view isHidden];
LABEL_9:

  return v9;
}

- (void)restore
{
  view = self->_view;
  if (view)
  {
    unint64_t flags = self->_flags;
    if (flags)
    {
      v5 = [(UIView *)self->_placeholderView superview];
      [v5 insertSubview:self->_view belowSubview:self->_placeholderView];

      [(UIView *)self->_placeholderView removeFromSuperview];
      placeholderView = self->_placeholderView;
      self->_placeholderView = 0;

      view = self->_view;
      unint64_t flags = self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_4:
        if ((flags & 0x10) == 0) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_4;
    }
    long long v7 = *(_OWORD *)&self->_transform.c;
    v10[0] = *(_OWORD *)&self->_transform.a;
    v10[1] = v7;
    v10[2] = *(_OWORD *)&self->_transform.tx;
    [(UIView *)view setTransform:v10];
    view = self->_view;
    unint64_t flags = self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
LABEL_13:
    -[UIView setFrame:](view, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
    view = self->_view;
    unint64_t flags = self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_6:
      if ((flags & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
LABEL_14:
    double zPosition = self->_zPosition;
    v9 = [(UIView *)view layer];
    [v9 setZPosition:zPosition];

    view = self->_view;
    unint64_t flags = self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_7:
      if ((flags & 0x20) == 0)
      {
LABEL_9:
        self->_view = 0;

        return;
      }
LABEL_8:
      [(UIView *)view setHidden:self->_hidden];
      view = self->_view;
      goto LABEL_9;
    }
LABEL_15:
    [(UIView *)view setAutoresizingMask:self->_autoresizingMask];
    view = self->_view;
    if ((self->_flags & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
}

- (void)dealloc
{
  [(UIView *)self->_placeholderView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)IMViewState;
  [(IMViewState *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end