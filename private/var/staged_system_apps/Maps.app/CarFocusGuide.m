@interface CarFocusGuide
+ (BOOL)_validateDirection:(unint64_t)a3;
- (CarFocusGuide)initWithOriginView:(id)a3 toDestinationFocusEnvironments:(id)a4 forDirection:(unint64_t)a5;
- (NSArray)activationConstraints;
- (UIView)debugView;
- (id)description;
- (void)setEnabled:(BOOL)a3;
@end

@implementation CarFocusGuide

- (CarFocusGuide)initWithOriginView:(id)a3 toDestinationFocusEnvironments:(id)a4 forDirection:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!+[CarFocusGuide _validateDirection:a5])
  {
    v26 = sub_100577BD4();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      goto LABEL_16;
    }
    v27 = self;
    if (!v27)
    {
      v32 = @"<nil>";
      goto LABEL_14;
    }
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    if (objc_opt_respondsToSelector())
    {
      v30 = [(CarFocusGuide *)v27 performSelector:"accessibilityIdentifier"];
      v31 = v30;
      if (v30 && ![v30 isEqualToString:v29])
      {
        v32 = +[NSString stringWithFormat:@"%@<%p, %@>", v29, v27, v31];

        goto LABEL_12;
      }
    }
    v32 = +[NSString stringWithFormat:@"%@<%p>", v29, v27];
LABEL_12:

LABEL_14:
    *(_DWORD *)buf = 138543362;
    v61 = v32;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Tried to create focusGuide with unsupported heading.", buf, 0xCu);

    goto LABEL_15;
  }
  v54.receiver = self;
  v54.super_class = (Class)CarFocusGuide;
  v10 = [(CarFocusGuide *)&v54 init];
  self = v10;
  if (!v10)
  {
LABEL_23:
    self = self;
    v33 = self;
    goto LABEL_24;
  }
  v10->_direction = a5;
  id v52 = v9;
  [(CarFocusGuide *)v10 setPreferredFocusEnvironments:v9];
  v11 = +[NSMutableArray array];
  v12 = [(CarFocusGuide *)self widthAnchor];
  v13 = [v8 widthAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v59[0] = v14;
  v15 = [(CarFocusGuide *)self heightAnchor];
  v53 = v8;
  v16 = [v8 heightAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v59[1] = v17;
  v18 = +[NSArray arrayWithObjects:v59 count:2];
  [v11 addObjectsFromArray:v18];

  switch(a5)
  {
    case 1uLL:
      v19 = [(CarFocusGuide *)self bottomAnchor];
      v20 = [v53 topAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      v57[0] = v21;
      v22 = [(CarFocusGuide *)self leftAnchor];
      v23 = [v53 leftAnchor];
      v24 = [v22 constraintEqualToAnchor:v23];
      v57[1] = v24;
      v25 = v57;
      goto LABEL_20;
    case 2uLL:
      v19 = [(CarFocusGuide *)self topAnchor];
      v20 = [v53 bottomAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      v58[0] = v21;
      v22 = [(CarFocusGuide *)self leftAnchor];
      v23 = [v53 leftAnchor];
      v24 = [v22 constraintEqualToAnchor:v23];
      v58[1] = v24;
      v25 = v58;
      goto LABEL_20;
    case 4uLL:
      v19 = [(CarFocusGuide *)self topAnchor];
      v20 = [v53 topAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      v56[0] = v21;
      v22 = [(CarFocusGuide *)self rightAnchor];
      v23 = [v53 leftAnchor];
      v24 = [v22 constraintEqualToAnchor:v23];
      v56[1] = v24;
      v25 = v56;
      goto LABEL_20;
    case 8uLL:
      v19 = [(CarFocusGuide *)self topAnchor];
      v20 = [v53 topAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      v55[0] = v21;
      v22 = [(CarFocusGuide *)self leftAnchor];
      v23 = [v53 rightAnchor];
      v24 = [v22 constraintEqualToAnchor:v23];
      v55[1] = v24;
      v25 = v55;
LABEL_20:
      v34 = +[NSArray arrayWithObjects:v25 count:2];
      [v11 addObjectsFromArray:v34];

      v35 = +[NSUserDefaults standardUserDefaults];
      unsigned int v36 = [v35 BOOLForKey:@"__internal_CarVisualizeFocusGuidesDebug"];

      if (v36)
      {
        v37 = [[CarFocusGuideDebugView alloc] initWithDirection:a5];
        debugView = self->_debugView;
        self->_debugView = v37;

        [(CarFocusGuideDebugView *)self->_debugView setTranslatesAutoresizingMaskIntoConstraints:0];
        LODWORD(v39) = 1148846080;
        v40 = [(CarFocusGuideDebugView *)self->_debugView _maps_constraintsEqualToEdgesOfLayoutGuide:self priority:v39];
        v41 = [v40 allConstraints];
        [v11 addObjectsFromArray:v41];
      }
      v42 = (NSArray *)[v11 copy];
      activationConstraints = self->_activationConstraints;
      self->_activationConstraints = v42;

      id v9 = v52;
      id v8 = v53;
      goto LABEL_23;
    default:
      v45 = sub_100577BD4();
      id v9 = v52;
      id v8 = v53;
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      v46 = self;
      v47 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v47);
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_30;
      }
      v49 = [(CarFocusGuide *)v46 performSelector:"accessibilityIdentifier"];
      v50 = v49;
      if (v49 && ![v49 isEqualToString:v48])
      {
        v51 = +[NSString stringWithFormat:@"%@<%p, %@>", v48, v46, v50];
      }
      else
      {

LABEL_30:
        v51 = +[NSString stringWithFormat:@"%@<%p>", v48, v46];
      }

      *(_DWORD *)buf = 138543362;
      v61 = v51;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "[%{public}@] CarMapsFocusGuide tried to add focus guide for unsupported direction.", buf, 0xCu);

LABEL_32:
      break;
  }
LABEL_16:
  v33 = 0;
LABEL_24:

  return v33;
}

+ (BOOL)_validateDirection:(unint64_t)a3
{
  return (a3 < 9) & (0x116u >> a3);
}

- (id)description
{
  v3 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v4 = [(CarFocusGuide *)self activationConstraints];
  id v5 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if ([v3 length]) {
          [v3 appendString:@", "];
        }
        [v3 appendFormat:@"%p" v8];
      }
      id v5 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v5);
  }

  uint64_t v9 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originView);
  v11 = [(CarFocusGuide *)self preferredFocusEnvironments];
  unint64_t direction = self->_direction;
  if (direction)
  {
    v13 = +[NSMutableString string];
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    char v37 = 0;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1008B3EAC;
    v33[3] = &unk_1012FF430;
    id v14 = v13;
    id v34 = v14;
    v35 = v36;
    v15 = objc_retainBlock(v33);
    v16 = (void (**)(void, void))v15;
    if (direction) {
      ((void (*)(void *, const __CFString *))v15[2])(v15, @"Up");
    }
    if ((direction & 2) != 0) {
      ((void (**)(void, const __CFString *))v16)[2](v16, @"Down");
    }
    if ((direction & 4) != 0) {
      ((void (**)(void, const __CFString *))v16)[2](v16, @"Left");
    }
    if ((direction & 8) != 0) {
      ((void (**)(void, const __CFString *))v16)[2](v16, @"Right");
    }
    if ((direction & 0x20) != 0) {
      ((void (**)(void, const __CFString *))v16)[2](v16, @"Previous");
    }
    if ((direction & 0x10) != 0) {
      ((void (**)(void, const __CFString *))v16)[2](v16, @"Next");
    }
    v17 = (__CFString *)v14;

    _Block_object_dispose(v36, 8);
  }
  else
  {
    v17 = @"None";
  }
  if ([(CarFocusGuide *)self isEnabled]) {
    CFStringRef v18 = @"YES";
  }
  else {
    CFStringRef v18 = @"NO";
  }
  [(CarFocusGuide *)self layoutFrame];
  uint64_t v20 = v19;
  [(CarFocusGuide *)self layoutFrame];
  uint64_t v22 = v21;
  [(CarFocusGuide *)self layoutFrame];
  uint64_t v24 = v23;
  [(CarFocusGuide *)self layoutFrame];
  v26 = +[NSString stringWithFormat:@"(%.1fh %.1fw)(%.1fx %.1fy)", v20, v22, v24, v25];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; guidedView=%p: preferredFocusEnvironments=%p; focusHeading=%@ enabled=%@ layoutFrame=%@ constraints=[%@]>",
    v9,
    self,
    WeakRetained,
    v11,
    v17,
    v18,
    v26,
  v27 = v3);

  return v27;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarFocusGuide;
  -[CarFocusGuide setEnabled:](&v6, "setEnabled:");
  id v5 = [(CarFocusGuide *)self debugView];
  [v5 setUserInteractionEnabled:v3];
}

- (UIView)debugView
{
  return (UIView *)self->_debugView;
}

- (NSArray)activationConstraints
{
  return self->_activationConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationConstraints, 0);
  objc_storeStrong((id *)&self->_debugView, 0);

  objc_destroyWeak((id *)&self->_originView);
}

@end