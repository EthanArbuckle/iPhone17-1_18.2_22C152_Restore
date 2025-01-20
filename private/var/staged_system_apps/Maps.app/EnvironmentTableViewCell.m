@interface EnvironmentTableViewCell
- (EnvironmentTableViewCell)initWithReuseIdentifier:(id)a3;
- (UIButton)errorButton;
- (void)_configureEnvironmentCell;
- (void)_startObservingEnvironment:(id)a3;
- (void)_startObservingProgressForEnvironment:(id)a3;
- (void)_stopObservingEnvironment;
- (void)_stopObservingProgress;
- (void)configureFromEnvironment:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
@end

@implementation EnvironmentTableViewCell

- (void)_configureEnvironmentCell
{
  v3 = +[UIImage systemImageNamed:@"checkmark"];
  v4 = [(EnvironmentTableViewCell *)self imageView];
  [v4 setImage:v3];

  v5 = +[UIColor tertiaryLabelColor];
  v6 = [(EnvironmentTableViewCell *)self detailTextLabel];
  [v6 setTextColor:v5];

  v7 = +[UIButton buttonWithType:118];
  errorButton = self->_errorButton;
  self->_errorButton = v7;

  v9 = +[UIColor systemRedColor];
  [(UIButton *)self->_errorButton setTintColor:v9];

  v10 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  loadingView = self->_loadingView;
  self->_loadingView = v10;

  v12 = +[UIColor secondaryLabelColor];
  [(UIActivityIndicatorView *)self->_loadingView setColor:v12];

  v13 = [MapsPieProgressView alloc];
  v14 = [(EnvironmentTableViewCell *)self imageView];
  [v14 frame];
  CGFloat v15 = CGRectGetMidX(v34) + -12.0;
  v16 = [(EnvironmentTableViewCell *)self imageView];
  [v16 frame];
  v17 = -[MapsPieProgressView initWithFrame:](v13, "initWithFrame:", v15, CGRectGetMidY(v35) + -12.0, 24.0, 24.0);
  progressView = self->_progressView;
  self->_progressView = v17;

  [(MapsPieProgressView *)self->_progressView setHidden:1];
  [(EnvironmentTableViewCell *)self addSubview:self->_progressView];
  id v19 = objc_alloc((Class)UIImageView);
  v20 = +[UIImage systemImageNamed:@"lock.fill"];
  v21 = (UIImageView *)[v19 initWithImage:v20];
  secureEnvironmentImageView = self->_secureEnvironmentImageView;
  self->_secureEnvironmentImageView = v21;

  v23 = +[UIColor secondaryLabelColor];
  [(UIImageView *)self->_secureEnvironmentImageView setTintColor:v23];

  [(UIImageView *)self->_secureEnvironmentImageView setHidden:1];
  [(UIImageView *)self->_secureEnvironmentImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(EnvironmentTableViewCell *)self addSubview:self->_secureEnvironmentImageView];
  v24 = [(UIImageView *)self->_secureEnvironmentImageView firstBaselineAnchor];
  v25 = [(EnvironmentTableViewCell *)self textLabel];
  v26 = [v25 firstBaselineAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  v33[0] = v27;
  v28 = [(UIImageView *)self->_secureEnvironmentImageView leadingAnchor];
  v29 = [(EnvironmentTableViewCell *)self textLabel];
  v30 = [v29 trailingAnchor];
  v31 = [v28 constraintEqualToSystemSpacingAfterAnchor:v30 multiplier:1.0];
  v33[1] = v31;
  v32 = +[NSArray arrayWithObjects:v33 count:2];
  +[NSLayoutConstraint activateConstraints:v32];
}

- (EnvironmentTableViewCell)initWithReuseIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EnvironmentTableViewCell;
  v3 = [(EnvironmentTableViewCell *)&v7 initWithStyle:3 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    [(EnvironmentTableViewCell *)v3 _configureEnvironmentCell];
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  [(EnvironmentTableViewCell *)self _stopObservingProgress];
  [(EnvironmentTableViewCell *)self _stopObservingEnvironment];
  v3.receiver = self;
  v3.super_class = (Class)EnvironmentTableViewCell;
  [(EnvironmentTableViewCell *)&v3 dealloc];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)EnvironmentTableViewCell;
  [(EnvironmentTableViewCell *)&v4 prepareForReuse];
  [(EnvironmentTableViewCell *)self _stopObservingProgress];
  [(EnvironmentTableViewCell *)self _stopObservingEnvironment];
  environment = self->_environment;
  self->_environment = 0;
}

- (void)_startObservingEnvironment:(id)a3
{
  if (a3 && self->_environment != a3)
  {
    id v4 = a3;
    [v4 addObserver:self forKeyPath:@"state" options:1 context:0];
    [v4 addObserver:self forKeyPath:@"activationProgress" options:1 context:0];
  }
}

- (void)_stopObservingEnvironment
{
  environment = self->_environment;
  if (environment)
  {
    [(GEOEnvironmentInfo *)environment removeObserver:self forKeyPath:@"state"];
    id v4 = self->_environment;
    [(GEOEnvironmentInfo *)v4 removeObserver:self forKeyPath:@"activationProgress"];
  }
}

- (void)_startObservingProgressForEnvironment:(id)a3
{
  id v10 = a3;
  id v4 = [v10 activationProgress];
  observedProgress = self->_observedProgress;

  if (v4 != observedProgress)
  {
    if (self->_observedProgress) {
      [(EnvironmentTableViewCell *)self _stopObservingProgress];
    }
    v6 = [v10 activationProgress];
    objc_super v7 = self->_observedProgress;
    self->_observedProgress = v6;

    v8 = self->_observedProgress;
    if (v8)
    {
      [(NSProgress *)v8 fractionCompleted];
      *(float *)&double v9 = v9;
      [(MapsPieProgressView *)self->_progressView setProgress:*(float *)&v9];
      [(NSProgress *)self->_observedProgress addObserver:self forKeyPath:@"fractionCompleted" options:1 context:0];
      [(NSProgress *)self->_observedProgress addObserver:self forKeyPath:@"isFinished" options:1 context:0];
      [(NSProgress *)self->_observedProgress addObserver:self forKeyPath:@"isCancelled" options:1 context:0];
    }
  }
}

- (void)_stopObservingProgress
{
  observedProgress = self->_observedProgress;
  if (observedProgress)
  {
    [(NSProgress *)observedProgress removeObserver:self forKeyPath:@"fractionCompleted"];
    [(NSProgress *)self->_observedProgress removeObserver:self forKeyPath:@"isFinished"];
    [(NSProgress *)self->_observedProgress removeObserver:self forKeyPath:@"isCancelled"];
    id v4 = self->_observedProgress;
    self->_observedProgress = 0;
  }
}

- (void)configureFromEnvironment:(id)a3
{
  v5 = (GEOEnvironmentInfo *)a3;
  p_environment = &self->_environment;
  if (self->_environment != v5)
  {
    [(EnvironmentTableViewCell *)self _stopObservingEnvironment];
    [(EnvironmentTableViewCell *)self _startObservingEnvironment:v5];
  }
  objc_storeStrong((id *)&self->_environment, a3);
  unsigned int v7 = [(GEOEnvironmentInfo *)v5 isActive];
  if (v7)
  {
    p_environment = [(GEOEnvironmentInfo *)v5 activationProgress];
    BOOL v8 = p_environment != 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  double v9 = [(EnvironmentTableViewCell *)self imageView];
  [v9 setHidden:v8];

  if (v7) {
  id v10 = [(GEOEnvironmentInfo *)v5 state];
  }
  loadingView = self->_loadingView;
  if (v10 == (id)1) {
    [(UIActivityIndicatorView *)loadingView startAnimating];
  }
  else {
    [(UIActivityIndicatorView *)loadingView stopAnimating];
  }
  v12 = [(GEOEnvironmentInfo *)v5 activationProgress];

  if (v12)
  {
    [(EnvironmentTableViewCell *)self _startObservingProgressForEnvironment:v5];
    [(MapsPieProgressView *)self->_progressView setHidden:0];
  }
  else
  {
    [(MapsPieProgressView *)self->_progressView setHidden:1];
    [(EnvironmentTableViewCell *)self _stopObservingProgress];
  }
  [(UIImageView *)self->_secureEnvironmentImageView setHidden:1];
  id v13 = [(GEOEnvironmentInfo *)v5 state];
  if (v13 == (id)1)
  {
    [(EnvironmentTableViewCell *)self setAccessoryType:0];
    errorButton = self->_loadingView;
LABEL_36:
    v36 = self;
    goto LABEL_38;
  }
  if (v13 == (id)3)
  {
    [(EnvironmentTableViewCell *)self setAccessoryType:0];
    errorButton = self->_errorButton;
    goto LABEL_36;
  }
  if (v13 == (id)2)
  {
    [(EnvironmentTableViewCell *)self setAccessoryType:2];
    [(EnvironmentTableViewCell *)self setAccessoryView:0];
    [(EnvironmentTableViewCell *)self setSelectionStyle:1];
    v14 = +[UIColor labelColor];
    CGFloat v15 = [(EnvironmentTableViewCell *)self textLabel];
    [v15 setTextColor:v14];

    v16 = [(GEOEnvironmentInfo *)v5 resourceManifest];
    id v17 = [v16 resources];
    if (!v17)
    {
      int v34 = 0;
      goto LABEL_43;
    }
    v18 = +[GEOResourceManifestManager modernManager];
    id v19 = [v18 activeTileGroup];
    v20 = [v19 dataSet];
    v21 = [v17 preferedURLSetFor:v20];

    if (![v21 hasAuthProxyURL])
    {
      int v34 = 0;
LABEL_42:

LABEL_43:
      [(UIImageView *)self->_secureEnvironmentImageView setHidden:v34 ^ 1u];

      goto LABEL_44;
    }
    v39 = v16;
    v22 = [v17 data];
    v23 = GEOGetProxyAuthFromResourceManifest();

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v24 = [v23 allValues];
    id v25 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v41;
LABEL_21:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        if ([*(id *)(*((void *)&v40 + 1) + 8 * v28) BOOLValue]) {
          break;
        }
        if (v26 == (id)++v28)
        {
          id v26 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v26) {
            goto LABEL_21;
          }
          goto LABEL_27;
        }
      }
    }
    else
    {
LABEL_27:

      v29 = [v17 tileGroups];
      v24 = [v29 firstObject];

      if (!v24 || ![v24 tileSetsCount])
      {
LABEL_33:
        int v34 = 0;
LABEL_41:

        v16 = v39;
        goto LABEL_42;
      }
      uint64_t v30 = 0;
      while (1)
      {
        unint64_t v31 = (unint64_t)[v24 tileSetAtIndex:v30];
        if ((unint64_t)[v17 tileSetsCount] > HIDWORD(v31))
        {
          uint64_t v32 = [v17 tileSets];
          v33 = [(id)v32 objectAtIndexedSubscript:HIDWORD(v31)];

          LOBYTE(v32) = [v33 useAuthProxy];
          if (v32) {
            break;
          }
        }
        if (++v30 >= (unint64_t)[v24 tileSetsCount]) {
          goto LABEL_33;
        }
      }
    }
    int v34 = 1;
    goto LABEL_41;
  }
  [(EnvironmentTableViewCell *)self setAccessoryType:0];
  v36 = self;
  errorButton = 0;
LABEL_38:
  [(EnvironmentTableViewCell *)v36 setAccessoryView:errorButton];
  [(EnvironmentTableViewCell *)self setSelectionStyle:0];
  v37 = +[UIColor secondaryLabelColor];
  v38 = [(EnvironmentTableViewCell *)self textLabel];
  [v38 setTextColor:v37];

LABEL_44:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = (NSProgress *)a4;
  id v12 = a5;
  if ((NSProgress *)self->_environment == v11)
  {
    [(EnvironmentTableViewCell *)self configureFromEnvironment:v11];
  }
  else if (self->_observedProgress == v11)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100D22824;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)EnvironmentTableViewCell;
    [(EnvironmentTableViewCell *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)EnvironmentTableViewCell;
  [(EnvironmentTableViewCell *)&v11 layoutSubviews];
  objc_super v3 = [(EnvironmentTableViewCell *)self imageView];
  [v3 frame];
  double MidX = CGRectGetMidX(v12);
  [(MapsPieProgressView *)self->_progressView bounds];
  double v5 = MidX - CGRectGetWidth(v13) * 0.5;
  v6 = [(EnvironmentTableViewCell *)self imageView];
  [v6 frame];
  double MidY = CGRectGetMidY(v14);
  [(MapsPieProgressView *)self->_progressView bounds];
  double v8 = MidY - CGRectGetHeight(v15) * 0.5;
  [(MapsPieProgressView *)self->_progressView bounds];
  double v10 = v9;
  [(MapsPieProgressView *)self->_progressView bounds];
  -[MapsPieProgressView setFrame:](self->_progressView, "setFrame:", v5, v8, v10);
}

- (UIButton)errorButton
{
  return self->_errorButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureEnvironmentImageView, 0);
  objc_storeStrong((id *)&self->_observedProgress, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_errorButton, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end