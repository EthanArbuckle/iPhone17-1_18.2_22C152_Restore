@interface CRLImageToolbarButtonItem
+ (id)itemWithImageNamed:(id)a3 target:(id)a4 action:(SEL)a5;
- (BOOL)isOn;
- (CRLImageToolbarButton)button;
- (CRLImageToolbarButtonItem)init;
- (CRLImageToolbarButtonItem)initWithCoder:(id)a3;
- (CRLImageToolbarButtonItem)initWithImageNamed:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)didTapButton:(id)a3 withEvent:(id)a4;
- (void)setButtonImageWithImageNamed:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setLandscapeImagePhone:(id)a3;
- (void)setOn:(BOOL)a3;
@end

@implementation CRLImageToolbarButtonItem

- (CRLImageToolbarButtonItem)initWithImageNamed:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CRLImageToolbarButtonItem;
  v10 = [(CRLImageToolbarButtonItem *)&v15 init];
  v11 = v10;
  if (v10)
  {
    [(CRLImageToolbarButtonItem *)v10 setStyle:0];
    [(CRLImageToolbarButtonItem *)v11 setTarget:v9];
    [(CRLImageToolbarButtonItem *)v11 setAction:a5];
    uint64_t v12 = +[CRLImageToolbarButton buttonWithType:1];
    button = v11->_button;
    v11->_button = (CRLImageToolbarButton *)v12;

    [(CRLImageToolbarButton *)v11->_button addTarget:v11 action:"didTapButton:withEvent:" forControlEvents:64];
    [(CRLImageToolbarButton *)v11->_button setImageNamed:v8];
    [(CRLImageToolbarButtonItem *)v11 setCustomView:v11->_button];
  }

  return v11;
}

+ (id)itemWithImageNamed:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithImageNamed:v9 target:v8 action:a5];

  return v10;
}

- (CRLImageToolbarButtonItem)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EDBD8);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLImageToolbarButtonItem init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m";
    __int16 v17 = 1024;
    int v18 = 40;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EDBF8);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButtonItem init]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:40 isFatal:0 description:"Do not call method"];

  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLImageToolbarButtonItem init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLImageToolbarButtonItem)initWithCoder:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EDC18);
  }
  v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v14 = v4;
    __int16 v15 = 2082;
    v16 = "-[CRLImageToolbarButtonItem initWithCoder:]";
    __int16 v17 = 2082;
    int v18 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m";
    __int16 v19 = 1024;
    int v20 = 44;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EDC38);
  }
  v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v7 = v6;
    id v8 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v14 = v4;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButtonItem initWithCoder:]");
  id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m"];
  +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:44 isFatal:0 description:"Do not call method"];

  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLImageToolbarButtonItem initWithCoder:]");
  id v12 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (void)setButtonImageWithImageNamed:(id)a3
{
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  if ([v4 isSymbolImage])
  {
    [(CRLImageToolbarButton *)self->_button setImage:v4];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EDC58);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109E578();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EDC78);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButtonItem setImage:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:58 isFatal:0 description:"Only symbol images are supported"];
  }
}

- (void)setLandscapeImagePhone:(id)a3
{
  id v4 = a3;
  if ([v4 isSymbolImage])
  {
    [(CRLImageToolbarButton *)self->_button setImage:v4];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EDC98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109E60C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EDCB8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButtonItem setLandscapeImagePhone:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButtonItem.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:68 isFatal:0 description:"Only symbol images are supported"];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CRLImageToolbarButtonItem;
  -[CRLImageToolbarButtonItem setEnabled:](&v5, "setEnabled:");
  [(CRLImageToolbarButton *)self->_button setEnabled:v3];
}

- (BOOL)isOn
{
  return [(CRLImageToolbarButton *)self->_button isOn];
}

- (void)setOn:(BOOL)a3
{
}

- (void)didTapButton:(id)a3 withEvent:(id)a4
{
  id v8 = a4;
  if ([(CRLImageToolbarButtonItem *)self action])
  {
    objc_super v5 = +[UIApplication sharedApplication];
    id v6 = [(CRLImageToolbarButtonItem *)self action];
    v7 = [(CRLImageToolbarButtonItem *)self target];
    [v5 sendAction:v6 to:v7 from:self forEvent:v8];
  }
}

- (CRLImageToolbarButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
}

@end