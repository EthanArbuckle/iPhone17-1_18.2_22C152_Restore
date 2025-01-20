@interface MapsDebugActionTableRow
- (BOOL)_showingProgressView;
- (BOOL)isDestructive;
- (NSProgress)observingProgress;
- (id)_findTableView;
- (id)_progressView;
- (void)_createProgressViewIfNeeded;
- (void)_setProgressViewHidden:(BOOL)a3;
- (void)configureCell:(id)a3;
- (void)configureCollectionViewCell:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setIsDestructive:(BOOL)a3;
- (void)setObservingProgress:(id)a3;
- (void)setSelectionAction:(id)a3;
@end

@implementation MapsDebugActionTableRow

- (void)dealloc
{
  [(MapsDebugActionTableRow *)self setObservingProgress:0];
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugActionTableRow;
  [(MapsDebugTableRow *)&v3 dealloc];
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsDebugActionTableRow;
  [(MapsDebugTableRow *)&v11 configureCell:v4];
  v5 = [v4 contentConfiguration];
  unsigned int v6 = [(MapsDebugActionTableRow *)self isDestructive];
  v7 = [(MapsDebugTableRow *)self selectionAction];
  if (v6)
  {
    if (v7) {
      +[UIColor systemRedColor];
    }
    else {
      +[UIColor systemDarkRedColor];
    }
  }
  else if (v7)
  {
    +[UIColor _maps_keyColor];
  }
  else
  {
    +[UIColor secondaryLabelColor];
  uint64_t v8 = };
  v9 = (void *)v8;
  v10 = [v5 textProperties];
  [v10 setColor:v9];

  [v4 setContentConfiguration:v5];
}

- (void)configureCollectionViewCell:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsDebugActionTableRow;
  [(MapsDebugTableRow *)&v10 configureCollectionViewCell:v4];
  id v5 = v4;
  unsigned int v6 = [v5 contentConfiguration];
  v7 = [(MapsDebugTableRow *)self selectionAction];
  if (v7) {
    +[UIColor _maps_keyColor];
  }
  else {
  uint64_t v8 = +[UIColor secondaryLabelColor];
  }

  if (v6)
  {
    v9 = [v6 textProperties];
    [v9 setColor:v8];
  }
  else
  {
    v9 = [v5 textLabel];
    [v9 setTextColor:v8];
  }

  [v5 setContentConfiguration:v6];
}

- (void)setObservingProgress:(id)a3
{
  id v8 = a3;
  p_observingProgress = &self->_observingProgress;
  observingProgress = self->_observingProgress;
  if (observingProgress)
  {
    [(NSProgress *)observingProgress removeObserver:self forKeyPath:@"fractionCompleted"];
    [(NSProgress *)*p_observingProgress removeObserver:self forKeyPath:@"isFinished"];
    [(NSProgress *)*p_observingProgress removeObserver:self forKeyPath:@"isCancelled"];
  }
  objc_storeStrong((id *)&self->_observingProgress, a3);
  if (*p_observingProgress)
  {
    [(NSProgress *)*p_observingProgress addObserver:self forKeyPath:@"fractionCompleted" options:1 context:0];
    [(NSProgress *)*p_observingProgress addObserver:self forKeyPath:@"isFinished" options:1 context:0];
    [(NSProgress *)*p_observingProgress addObserver:self forKeyPath:@"isCancelled" options:1 context:0];
    BOOL v7 = *p_observingProgress == 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  [(MapsDebugActionTableRow *)self _setProgressViewHidden:v7];
}

- (id)_findTableView
{
  v2 = [(MapsDebugTableRow *)self currentCell];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (void)_setProgressViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MapsDebugActionTableRow *)self _showingProgressView];
  if (v3 && v5)
  {
    unsigned int v6 = [(MapsDebugTableRow *)self currentCell];
    [v6 setAccessoryView:0];

    id v16 = [(MapsDebugTableRow *)self currentCollectionViewCell];
    [v16 setTrailingAccessoryConfigurations:&__NSArray0__struct];
    progressViewAccessory = self->_progressViewAccessory;
    self->_progressViewAccessory = 0;

LABEL_8:

    return;
  }
  if ((v5 | v3)) {
    return;
  }
  [(MapsDebugActionTableRow *)self _createProgressViewIfNeeded];
  id v8 = [(MapsDebugTableRow *)self currentCell];

  if (v8)
  {
    progressView = self->_progressView;
    id v16 = [(MapsDebugTableRow *)self currentCell];
    [v16 setAccessoryView:progressView];
    goto LABEL_8;
  }
  objc_super v10 = [(MapsDebugTableRow *)self currentCollectionViewCell];

  if (v10)
  {
    id v11 = [objc_alloc((Class)_UICellAccessoryConfigurationCustomView) initWithCustomView:self->_progressView];
    [v11 setMaintainsFixedSize:1];
    v12 = self->_progressViewAccessory;
    self->_progressViewAccessory = (_UICellAccessoryConfigurationCustomView *)v11;
    id v13 = v11;

    v14 = [(MapsDebugTableRow *)self currentCollectionViewCell];
    id v17 = v13;
    v15 = +[NSArray arrayWithObjects:&v17 count:1];

    [v14 setTrailingAccessoryConfigurations:v15];
  }
}

- (void)_createProgressViewIfNeeded
{
  if (!self->_progressView)
  {
    BOOL v3 = -[MapsPieProgressView initWithFrame:]([MapsPieProgressView alloc], "initWithFrame:", 0.0, 0.0, 24.0, 24.0);
    progressView = self->_progressView;
    self->_progressView = v3;
  }
}

- (BOOL)_showingProgressView
{
  if (!self->_progressView) {
    return 0;
  }
  uint64_t v3 = [(MapsDebugTableRow *)self currentCell];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned int v5 = [(MapsDebugTableRow *)self currentCell];
    unsigned int v6 = [v5 accessoryView];
    progressView = self->_progressView;

    if (v6 == progressView) {
      return 1;
    }
  }
  id v8 = [(MapsDebugTableRow *)self currentCollectionViewCell];
  if (v8 && (progressViewAccessory = self->_progressViewAccessory, v8, progressViewAccessory)) {
    return 1;
  }
  else {
    return 0;
  }
}

- (id)_progressView
{
  uint64_t v3 = [(MapsDebugTableRow *)self currentCell];

  if (v3)
  {
    id v4 = [(MapsDebugTableRow *)self currentCell];
    unsigned int v5 = [v4 accessoryView];
  }
  else
  {
    unsigned int v5 = [(MapsDebugTableRow *)self currentCollectionViewCell];

    if (!v5) {
      goto LABEL_6;
    }
    id v4 = [(MapsDebugTableRow *)self currentCollectionViewCell];
    unsigned int v6 = [v4 trailingAccessoryConfigurations];
    BOOL v7 = [v6 firstObject];

    unsigned int v5 = [v7 customView];
  }
LABEL_6:

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_observingProgress == a4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10085487C;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MapsDebugActionTableRow;
    -[MapsDebugActionTableRow observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3);
  }
}

- (void)setSelectionAction:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100854A60;
    v6[3] = &unk_1012E9950;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)MapsDebugActionTableRow;
    [(MapsDebugTableRow *)&v5 setSelectionAction:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MapsDebugActionTableRow;
    [(MapsDebugTableRow *)&v10 setSelectionAction:0];
  }
}

- (NSProgress)observingProgress
{
  return self->_observingProgress;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_isDestructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observingProgress, 0);
  objc_storeStrong((id *)&self->_progressViewAccessory, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_destroyWeak((id *)&self->_internalProgress);
}

@end