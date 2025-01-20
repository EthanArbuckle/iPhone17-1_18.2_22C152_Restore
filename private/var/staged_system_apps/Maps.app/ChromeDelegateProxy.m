@interface ChromeDelegateProxy
+ (BOOL)_selectorIsProxiedDelegateMethod:(SEL)a3 isRequiredMethod:(BOOL *)a4;
+ (BOOL)_selectorIsProxiedDelegateMethod:(SEL)a3 protocol:(id *)a4 isRequiredMethod:(BOOL *)a5;
+ (BOOL)_selectorIsProxiedDelegateMethod:(SEL)a3 protocol:(id *)a4 isRequiredMethod:(BOOL *)a5 methodDescription:(objc_method_description *)a6;
+ (BOOL)selectorIsProxiedDelegateMethod:(SEL)a3;
+ (id)protocols;
- (BOOL)preferChromeForSelector:(SEL)a3 protocol:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (ChromeDelegateProxy)initWithChromeViewController:(id)a3;
- (id)_protocolForSelector:(SEL)a3;
- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4;
- (id)initForTesting;
- (id)lastProxiedTargets;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3 targets:(id *)a4;
- (void)addAdditionalDelegate:(id)a3 forProtocol:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)removeAdditionalDelegate:(id)a3 forProtocol:(id)a4;
@end

@implementation ChromeDelegateProxy

- (void)removeAdditionalDelegate:(id)a3 forProtocol:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!v6)
  {
    v7 = [(id)objc_opt_class() protocols];
    id v6 = [v7 firstObject];
  }
  v8 = [(NSMapTable *)self->_additionalDelegatesByProtocol objectForKey:v6];
  v9 = v8;
  if (v8)
  {
    [v8 removeObject:v10];
    if (![v9 count]) {
      [(NSMapTable *)self->_additionalDelegatesByProtocol removeObjectForKey:v6];
    }
  }
}

- (ChromeDelegateProxy)initWithChromeViewController:(id)a3
{
  if (self)
  {
    objc_storeWeak((id *)&self->_chromeViewController, a3);
    v4 = +[NSMapTable strongToStrongObjectsMapTable];
    additionalDelegatesByProtocol = self->_additionalDelegatesByProtocol;
    self->_additionalDelegatesByProtocol = v4;
  }
  return self;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v103 = 0;
  id v102 = 0;
  unsigned int v5 = objc_msgSend((id)objc_opt_class(), "_selectorIsProxiedDelegateMethod:protocol:isRequiredMethod:", objc_msgSend(v4, "selector"), &v102, &v103);
  id v6 = (Protocol *)v102;
  if (v5)
  {
    lastProxiedTargets = self->_lastProxiedTargets;
    self->_lastProxiedTargets = 0;

    id v101 = 0;
    v8 = -[ChromeDelegateProxy methodSignatureForSelector:targets:](self, "methodSignatureForSelector:targets:", [v4 selector], &v101);
    id v9 = v101;
    id v10 = v9;
    if (!v8)
    {
LABEL_60:

      goto LABEL_61;
    }
    if (self->_forTesting)
    {
      v11 = (NSOrderedSet *)[v9 copy];
      v12 = self->_lastProxiedTargets;
      self->_lastProxiedTargets = v11;
    }
    id v13 = [v8 methodReturnLength];
    id v88 = v4;
    id v94 = v13;
    v95 = self;
    if ([v10 count])
    {
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      v14 = v10;
      id v15 = [v14 countByEnumeratingWithState:&v97 objects:v114 count:16];
      if (v15)
      {
        id v16 = v15;
        v85 = v8;
        v86 = v10;
        uint64_t v17 = *(void *)v98;
        v18 = "return";
        if (!v13) {
          v18 = "no return";
        }
        v90 = v18;
        v19 = &selRef__updateSortedAppStoreAppsForTransportType_;
        uint64_t v91 = *(void *)v98;
        v92 = v14;
        v89 = v6;
        while (1)
        {
          v20 = 0;
          v96 = v19[326];
          id v93 = v16;
          do
          {
            if (*(void *)v98 != v17) {
              objc_enumerationMutation(v14);
            }
            v21 = *(void **)(*((void *)&v97 + 1) + 8 * (void)v20);
            v22 = sub_1000BAA48();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v23 = self;
              v24 = (objc_class *)objc_opt_class();
              v25 = NSStringFromClass(v24);
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_18;
              }
              v26 = [(ChromeDelegateProxy *)v23 performSelector:v96];
              v27 = v26;
              if (v26 && ![v26 isEqualToString:v25])
              {
                v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v25, v23, v27];
              }
              else
              {

LABEL_18:
                v28 = +[NSString stringWithFormat:@"%@<%p>", v25, v23];
              }

              id v29 = v28;
              v30 = NSStringFromProtocol(v6);
              v31 = NSStringFromSelector((SEL)[v4 selector]);
              id v32 = v21;
              if (v32)
              {
                v33 = (objc_class *)objc_opt_class();
                v34 = NSStringFromClass(v33);
                if ((objc_opt_respondsToSelector() & 1) == 0) {
                  goto LABEL_24;
                }
                v35 = [v32 performSelector:v96];
                v36 = v35;
                if (v35 && ![v35 isEqualToString:v34])
                {
                  v37 = +[NSString stringWithFormat:@"%@<%p, %@>", v34, v32, v36];

                  id v4 = v88;
                }
                else
                {

                  id v4 = v88;
LABEL_24:
                  v37 = +[NSString stringWithFormat:@"%@<%p>", v34, v32];
                }

                id v6 = v89;
              }
              else
              {
                v37 = @"<nil>";
              }

              *(_DWORD *)buf = 138413314;
              id v105 = v29;
              __int16 v106 = 2112;
              v107 = v30;
              __int16 v108 = 2112;
              uint64_t v109 = (uint64_t)v31;
              __int16 v110 = 2112;
              v111 = v37;
              __int16 v112 = 2080;
              v113 = v90;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@ %@ | %@ on %@ (%s)", buf, 0x34u);

              uint64_t v17 = v91;
              v14 = v92;
              id v13 = v94;
              self = v95;
              id v16 = v93;
            }

            [v4 invokeWithTarget:v21];
            if (v13) {
              goto LABEL_34;
            }
            v20 = (char *)v20 + 1;
          }
          while (v16 != v20);
          id v38 = [v14 countByEnumeratingWithState:&v97 objects:v114 count:16];
          id v16 = v38;
          v19 = &selRef__updateSortedAppStoreAppsForTransportType_;
          if (!v38)
          {
LABEL_34:
            v8 = v85;
            goto LABEL_58;
          }
        }
      }
      goto LABEL_59;
    }
    id v39 = v13;
    int v40 = v103;
    v41 = sub_1000BAA48();
    v14 = v41;
    if (v39 && v40)
    {
      v86 = v10;
      v42 = v8;
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        goto LABEL_52;
      }
      v43 = v95;
      v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      if (objc_opt_respondsToSelector())
      {
        v46 = [(ChromeDelegateProxy *)v43 performSelector:"accessibilityIdentifier"];
        v47 = v46;
        if (v46 && ![v46 isEqualToString:v45])
        {
          v48 = +[NSString stringWithFormat:@"%@<%p, %@>", v45, v43, v47];

          goto LABEL_43;
        }
      }
      v48 = +[NSString stringWithFormat:@"%@<%p>", v45, v43];
LABEL_43:

      v49 = NSStringFromProtocol(v6);
      v50 = NSStringFromSelector((SEL)[v4 selector]);
      *(_DWORD *)buf = 138412802;
      id v105 = v48;
      __int16 v106 = 2112;
      v107 = v49;
      __int16 v108 = 2112;
      uint64_t v109 = (uint64_t)v50;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%@ %@ | %@ (required, with return) - no targets", buf, 0x20u);

LABEL_52:
      v63 = v95;
      v64 = (objc_class *)objc_opt_class();
      v65 = NSStringFromClass(v64);
      if (objc_opt_respondsToSelector())
      {
        v66 = v6;
        v67 = [(ChromeDelegateProxy *)v63 performSelector:"accessibilityIdentifier"];
        v68 = v67;
        if (v67 && ![v67 isEqualToString:v65])
        {
          v69 = +[NSString stringWithFormat:@"%@<%p, %@>", v65, v63, v68];

          id v6 = v66;
LABEL_57:

          v70 = NSStringFromProtocol(v6);
          v71 = NSStringFromSelector((SEL)[v4 selector]);
          v72 = +[NSString stringWithFormat:@"%@ %@ | %@ (required, with return) - no targets", v69, v70, v71];
          v73 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v72 userInfo:0];

          v14 = v73;
          [v73 raise];
          v8 = v42;
LABEL_58:
          id v10 = v86;
          goto LABEL_59;
        }

        id v6 = v66;
      }
      v69 = +[NSString stringWithFormat:@"%@<%p>", v65, v63];
      goto LABEL_57;
    }
    BOOL v51 = os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG);
    if (v40)
    {
      if (v51)
      {
        v52 = v14;
        v53 = v10;
        v54 = v8;
        v55 = self;
        v56 = (objc_class *)objc_opt_class();
        v57 = NSStringFromClass(v56);
        if (objc_opt_respondsToSelector())
        {
          v58 = [(ChromeDelegateProxy *)v55 performSelector:"accessibilityIdentifier"];
          v59 = v58;
          if (v58 && ![v58 isEqualToString:v57])
          {
            v60 = +[NSString stringWithFormat:@"%@<%p, %@>", v57, v55, v59];

            goto LABEL_51;
          }
        }
        v60 = +[NSString stringWithFormat:@"%@<%p>", v57, v55];
LABEL_51:

        v61 = NSStringFromProtocol(v6);
        v62 = NSStringFromSelector((SEL)[v4 selector]);
        *(_DWORD *)buf = 138412802;
        id v105 = v60;
        __int16 v106 = 2112;
        v107 = v61;
        __int16 v108 = 2112;
        uint64_t v109 = (uint64_t)v62;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%@ %@ | %@ (required, no return) - no targets", buf, 0x20u);

        v8 = v54;
        id v10 = v53;
LABEL_71:
        v14 = v52;
      }
LABEL_59:

      goto LABEL_60;
    }
    if (!v51) {
      goto LABEL_59;
    }
    v52 = v14;
    v87 = v10;
    v74 = v8;
    v75 = self;
    v76 = (objc_class *)objc_opt_class();
    v77 = NSStringFromClass(v76);
    if (objc_opt_respondsToSelector())
    {
      v78 = [(ChromeDelegateProxy *)v75 performSelector:"accessibilityIdentifier"];
      v79 = v78;
      if (v78 && ![v78 isEqualToString:v77])
      {
        v80 = +[NSString stringWithFormat:@"%@<%p, %@>", v77, v75, v79];

        goto LABEL_68;
      }
    }
    v80 = +[NSString stringWithFormat:@"%@<%p>", v77, v75];
LABEL_68:

    v81 = NSStringFromProtocol(v6);
    uint64_t v82 = NSStringFromSelector((SEL)[v4 selector]);
    v83 = (void *)v82;
    v84 = "with return";
    *(_DWORD *)buf = 138413058;
    id v105 = v80;
    __int16 v106 = 2112;
    if (!v94) {
      v84 = "no return";
    }
    v107 = v81;
    __int16 v108 = 2112;
    uint64_t v109 = v82;
    __int16 v110 = 2080;
    v111 = (void *)v84;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%@ %@ | %@ (optional, %s) - no targets", buf, 0x2Au);

    v8 = v74;
    id v10 = v87;
    goto LABEL_71;
  }
LABEL_61:
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v10 = 0;
  BOOL v5 = 0;
  if ([(id)objc_opt_class() _selectorIsProxiedDelegateMethod:a3 isRequiredMethod:&v10])
  {
    if (v10)
    {
      return 1;
    }
    else
    {
      id v9 = 0;
      id v6 = [(ChromeDelegateProxy *)self methodSignatureForSelector:a3 targets:&v9];
      id v7 = v9;
      BOOL v5 = v6 && ![v6 methodReturnLength] || [v7 count] != 0;
    }
  }
  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3 targets:(id *)a4
{
  char v50 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  if (![(id)objc_opt_class() _selectorIsProxiedDelegateMethod:a3 protocol:0 isRequiredMethod:&v50 methodDescription:&v48])
  {
    id v7 = 0;
    goto LABEL_40;
  }
  if (!a4 && v50)
  {
    id v7 = +[NSMethodSignature signatureWithObjCTypes:v49];
    goto LABEL_40;
  }
  if (a4) {
    id v8 = [objc_alloc((Class)NSMutableOrderedSet) initWithCapacity:2];
  }
  else {
    id v8 = 0;
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_100104470;
  v46 = sub_100104AA8;
  id v47 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000BB328;
  v38[3] = &unk_10131C020;
  int v40 = &v42;
  SEL v41 = a3;
  id v28 = v8;
  id v39 = v28;
  id v9 = objc_retainBlock(v38);
  id v29 = [(ChromeDelegateProxy *)self _protocolForSelector:a3];
  -[ChromeDelegateProxy delegatesForSelector:protocol:](self, "delegatesForSelector:protocol:", a3);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v10);
        }
        ((void (*)(void *, void))v9[2])(v9, *(void *)(*((void *)&v34 + 1) + 8 * i));
      }
      id v11 = [v10 countByEnumeratingWithState:&v34 objects:v52 count:16];
    }
    while (v11);
  }

  [(NSMapTable *)self->_additionalDelegatesByProtocol objectForKey:v29];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [v14 countByEnumeratingWithState:&v30 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        ((void (*)(void *, void))v9[2])(v9, *(void *)(*((void *)&v30 + 1) + 8 * (void)j));
      }
      id v15 = [v14 countByEnumeratingWithState:&v30 objects:v51 count:16];
    }
    while (v15);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  uint64_t v19 = [WeakRetained methodSignatureForSelector:a3];

  if (v19)
  {
    id v20 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      unsigned int v22 = [(ChromeDelegateProxy *)self preferChromeForSelector:a3 protocol:v29];
      id v23 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      if (v22) {
        [v28 insertObject:v23 atIndex:0];
      }
      else {
        [v28 addObject:v23];
      }
    }
  }
  if (a4) {
    *a4 = v28;
  }
  uint64_t v24 = v43[5];
  if (v24) {
    v25 = (void *)v43[5];
  }
  else {
    v25 = (void *)v19;
  }
  if (!(v19 | v24))
  {
    if (v50 && ![v28 count])
    {
      id v26 = +[NSMethodSignature signatureWithObjCTypes:v49];
      goto LABEL_39;
    }
    v25 = 0;
  }
  id v26 = v25;
LABEL_39:
  id v7 = v26;

  _Block_object_dispose(&v42, 8);
LABEL_40:

  return v7;
}

- (id)_protocolForSelector:(SEL)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [objc_opt_class() protocols];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((unint64_t)protocol_getMethodDescription((Protocol *)v9, a3, 0, 1).name
          || (unint64_t)protocol_getMethodDescription((Protocol *)v9, a3, 1, 1).name)
        {
          id v10 = v9;
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v10 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }
LABEL_13:

  return v10;
}

+ (BOOL)_selectorIsProxiedDelegateMethod:(SEL)a3 protocol:(id *)a4 isRequiredMethod:(BOOL *)a5 methodDescription:(objc_method_description *)a6
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = [a1 protocols];
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v11)
  {
    BOOL v18 = 0;
    goto LABEL_21;
  }
  id v12 = v11;
  unsigned int v22 = a4;
  id v23 = a5;
  uint64_t v13 = *(void *)v25;
  while (2)
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v25 != v13) {
        objc_enumerationMutation(v10);
      }
      long long v15 = *(Protocol **)(*((void *)&v24 + 1) + 8 * i);
      objc_method_description MethodDescription = protocol_getMethodDescription(v15, a3, 0, 1);
      if (MethodDescription.name)
      {
        types = MethodDescription.types;
        name = MethodDescription.name;
LABEL_14:
        if (v22) {
          id *v22 = v15;
        }
        if (v23) {
          BOOL *v23 = MethodDescription.name == 0;
        }
        if (a6)
        {
          a6->name = name;
          a6->types = types;
        }
        BOOL v18 = 1;
        goto LABEL_21;
      }
      objc_method_description v17 = protocol_getMethodDescription(v15, a3, 1, 1);
      if (v17.name)
      {
        name = v17.name;
        types = v17.types;
        goto LABEL_14;
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    BOOL v18 = 0;
    if (v12) {
      continue;
    }
    break;
  }
LABEL_21:

  return v18;
}

+ (BOOL)_selectorIsProxiedDelegateMethod:(SEL)a3 protocol:(id *)a4 isRequiredMethod:(BOOL *)a5
{
  return [a1 _selectorIsProxiedDelegateMethod:a3 protocol:a4 isRequiredMethod:a5 methodDescription:0];
}

+ (BOOL)_selectorIsProxiedDelegateMethod:(SEL)a3 isRequiredMethod:(BOOL *)a4
{
  return [a1 _selectorIsProxiedDelegateMethod:a3 protocol:0 isRequiredMethod:a4];
}

- (BOOL)preferChromeForSelector:(SEL)a3 protocol:(id)a4
{
  return 0;
}

+ (BOOL)selectorIsProxiedDelegateMethod:(SEL)a3
{
  return [a1 _selectorIsProxiedDelegateMethod:a3 protocol:0 isRequiredMethod:0];
}

- (void)addAdditionalDelegate:(id)a3 forProtocol:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v7 = [(id)objc_opt_class() protocols];
    id v6 = [v7 firstObject];
  }
  id v8 = [(NSMapTable *)self->_additionalDelegatesByProtocol objectForKey:v6];
  if (!v8)
  {
    id v8 = +[NSHashTable weakObjectsHashTable];
    [(NSMapTable *)self->_additionalDelegatesByProtocol setObject:v8 forKey:v6];
  }
  if (([v8 containsObject:v9] & 1) == 0) {
    [v8 addObject:v9];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return [(ChromeDelegateProxy *)self methodSignatureForSelector:a3 targets:0];
}

+ (id)protocols
{
  return 0;
}

- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4
{
  return 0;
}

- (id)initForTesting
{
  v3 = objc_opt_new();
  id v4 = [(ChromeDelegateProxy *)self initWithChromeViewController:v3];

  if (v4) {
    v4->_forTesting = 1;
  }
  return v4;
}

- (id)lastProxiedTargets
{
  return self->_lastProxiedTargets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProxiedTargets, 0);
  objc_storeStrong((id *)&self->_additionalDelegatesByProtocol, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end