@interface ChromeContextTransition
- (BOOL)hasStarted;
- (ChromeContext)nextTopContext;
- (ChromeContext)previousTopContext;
- (GroupAnimation)enterAnimation;
- (GroupAnimation)leaveAnimation;
- (NSArray)pendingContexts;
- (id)initForTransitionFromContexts:(id)a3 toContexts:(id)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)runWithCompletion:(id)a3;
@end

@implementation ChromeContextTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingContexts, 0);
  objc_destroyWeak((id *)&self->_nextTopContext);
  objc_destroyWeak((id *)&self->_previousTopContext);
  objc_storeStrong((id *)&self->_enterAnimation, 0);

  objc_storeStrong((id *)&self->_leaveAnimation, 0);
}

- (void)dealloc
{
  v3 = sub_10006A198();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      v7 = [(ChromeContextTransition *)v4 performSelector:"accessibilityIdentifier"];
      v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] Deallocating", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)ChromeContextTransition;
  [(ChromeContextTransition *)&v10 dealloc];
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self->_leaveAnimation;
  v6 = self->_enterAnimation;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100108D18;
  v20[3] = &unk_1012E7D28;
  v7 = v6;
  v21 = v7;
  [(GroupAnimation *)v5 addCompletion:v20];
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004BA04;
  v16[3] = &unk_1012E7DB8;
  objc_copyWeak(&v18, &location);
  id v8 = v4;
  id v17 = v8;
  [(GroupAnimation *)v7 addCompletion:v16];
  v9 = sub_10006A198();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_super v10 = self;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      v13 = [(ChromeContextTransition *)v10 performSelector:"accessibilityIdentifier"];
      v14 = v13;
      if (v13 && ([v13 isEqualToString:v12] & 1) == 0)
      {
        v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_7;
      }
    }
    v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_7:

    *(_DWORD *)buf = 138543362;
    v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] Starting transition", buf, 0xCu);
  }
  [(GroupAnimation *)v5 runWithCurrentOptions];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)initForTransitionFromContexts:(id)a3 toContexts:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v60.receiver = self;
  v60.super_class = (Class)ChromeContextTransition;
  objc_super v10 = [(ChromeContextTransition *)&v60 init];
  if (v10)
  {
    v11 = [v8 lastObject];
    objc_storeWeak((id *)&v10->_previousTopContext, v11);

    v12 = [v9 lastObject];
    objc_storeWeak((id *)&v10->_nextTopContext, v12);

    objc_storeStrong((id *)&v10->_pendingContexts, a4);
    uint64_t v13 = +[GroupAnimation animationForAnimatedFlag:v5];
    leaveAnimation = v10->_leaveAnimation;
    v10->_leaveAnimation = (GroupAnimation *)v13;

    uint64_t v15 = +[GroupAnimation animationForAnimatedFlag:v5];
    enterAnimation = v10->_enterAnimation;
    v10->_enterAnimation = (GroupAnimation *)v15;

    id v17 = sub_10006A198();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    id v18 = v10;
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    if (objc_opt_respondsToSelector())
    {
      v21 = [(ChromeContextTransition *)v18 performSelector:"accessibilityIdentifier"];
      v22 = v21;
      if (v21 && ![v21 isEqualToString:v20])
      {
        v23 = +[NSString stringWithFormat:@"%@<%p, %@>", v20, v18, v22];

        goto LABEL_8;
      }
    }
    v23 = +[NSString stringWithFormat:@"%@<%p>", v20, v18];
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v62 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] Initialising", buf, 0xCu);

LABEL_9:
    v24 = sub_10006A198();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
LABEL_44:

      goto LABEL_45;
    }
    v25 = v10;
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v28 = NSCollectionLayoutEdgeSpacing_ptr;
    if (objc_opt_respondsToSelector())
    {
      v29 = [(ChromeContextTransition *)v25 performSelector:"accessibilityIdentifier"];
      v30 = v29;
      if (v29 && ![v29 isEqualToString:v27])
      {
        v31 = +[NSString stringWithFormat:@"%@<%p, %@>", v27, v25, v30];

        v28 = NSCollectionLayoutEdgeSpacing_ptr;
LABEL_15:

        id v32 = v31;
        v33 = "not ";
        if (v5) {
          v33 = "";
        }
        v58 = v33;
        v59 = v32;
        id v34 = v8;
        v35 = v34;
        if (v34)
        {
          if ([v34 count])
          {
            v36 = [v35 componentsJoinedByString:@", "];
            v37 = [v28[75] stringWithFormat:@"<%p> [%@]", v35, v36];
          }
          else
          {
            [v28[75] stringWithFormat:@"<%p> (empty)", v35];
            v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v37 = @"<nil>";
        }

        v57 = v37;
        id v38 = v9;
        v39 = v38;
        if (v38)
        {
          if ([v38 count])
          {
            v40 = [v39 componentsJoinedByString:@", "];
            v41 = [v28[75] stringWithFormat:@"<%p> [%@]", v39, v40];
          }
          else
          {
            [v28[75] stringWithFormat:@"<%p> (empty)", v39];
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v41 = @"<nil>";
        }

        v42 = v41;
        v43 = v10->_leaveAnimation;
        if (!v43)
        {
          v48 = @"<nil>";
LABEL_35:

          v49 = v48;
          v50 = v10->_enterAnimation;
          if (!v50)
          {
            v55 = @"<nil>";
            goto LABEL_43;
          }
          v51 = (objc_class *)objc_opt_class();
          v52 = NSStringFromClass(v51);
          if (objc_opt_respondsToSelector())
          {
            v53 = [(GroupAnimation *)v50 performSelector:"accessibilityIdentifier"];
            v54 = v53;
            if (v53 && ![v53 isEqualToString:v52])
            {
              v55 = +[NSString stringWithFormat:@"%@<%p, %@>", v52, v50, v54];

              goto LABEL_41;
            }
          }
          v55 = +[NSString stringWithFormat:@"%@<%p>", v52, v50];
LABEL_41:

LABEL_43:
          *(_DWORD *)buf = 138544642;
          v62 = v59;
          __int16 v63 = 2080;
          v64 = v58;
          __int16 v65 = 2114;
          v66 = v57;
          __int16 v67 = 2114;
          v68 = v42;
          __int16 v69 = 2114;
          v70 = v49;
          __int16 v71 = 2114;
          v72 = v55;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[%{public}@] Initialising transition (%sanimated)\n\tfrom: %{public}@\n\tto: %{public}@\nleaveAnimation: %{public}@\nenterAnimation: %{public}@", buf, 0x3Eu);

          goto LABEL_44;
        }
        v44 = (objc_class *)objc_opt_class();
        v45 = NSStringFromClass(v44);
        if (objc_opt_respondsToSelector())
        {
          v46 = [(GroupAnimation *)v43 performSelector:"accessibilityIdentifier"];
          v47 = v46;
          if (v46 && ![v46 isEqualToString:v45])
          {
            v48 = +[NSString stringWithFormat:@"%@<%p, %@>", v45, v43, v47];

            goto LABEL_33;
          }
        }
        v48 = +[NSString stringWithFormat:@"%@<%p>", v45, v43];
LABEL_33:

        goto LABEL_35;
      }

      v28 = NSCollectionLayoutEdgeSpacing_ptr;
    }
    v31 = [v28[75] stringWithFormat:@"%@<%p>", v27, v25];
    goto LABEL_15;
  }
LABEL_45:

  return v10;
}

- (BOOL)hasStarted
{
  if ([(GroupAnimation *)self->_leaveAnimation hasStarted]) {
    return 1;
  }
  enterAnimation = self->_enterAnimation;

  return [(GroupAnimation *)enterAnimation hasStarted];
}

- (ChromeContext)nextTopContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextTopContext);

  return (ChromeContext *)WeakRetained;
}

- (NSArray)pendingContexts
{
  return self->_pendingContexts;
}

- (ChromeContext)previousTopContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousTopContext);

  return (ChromeContext *)WeakRetained;
}

- (GroupAnimation)leaveAnimation
{
  return self->_leaveAnimation;
}

- (GroupAnimation)enterAnimation
{
  return self->_enterAnimation;
}

@end