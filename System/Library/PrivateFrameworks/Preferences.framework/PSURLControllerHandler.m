@interface PSURLControllerHandler
+ (void)registerApplicationURLStateProvider:(id)a3;
- (PSURLControllerHandlerDelegate)delegate;
- (void)_performCompletionAfterActiveTransitionCompletes:(id)a3;
- (void)_performScrollingAndHighlightingOperationsOnController:(id)a3 withOffset:(id)a4 scrollTargetIdentifier:(id)a5;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PSURLControllerHandler

- (void)setDelegate:(id)a3
{
}

+ (void)registerApplicationURLStateProvider:(id)a3
{
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PKLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PSURLControllerHandler *)self delegate];
    *(_DWORD *)buf = 136446978;
    v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
    __int16 v128 = 2160;
    uint64_t v129 = 1752392040;
    __int16 v130 = 2112;
    uint64_t v131 = (uint64_t)v6;
    __int16 v132 = 2112;
    *(void *)v133 = v9;
    _os_log_impl(&dword_1A6597000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: resourceDictionary: %{mask.hash}@, delegate: %@", buf, 0x2Au);
  }
  if (!_applicationStateProvider)
  {
    v11 = PKLogForCategory(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
      _os_log_impl(&dword_1A6597000, v11, OS_LOG_TYPE_INFO, "%{public}s: State provider not set, continuing.", buf, 0xCu);
    }
LABEL_12:

    v15 = [(PSURLControllerHandler *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = PKLogForCategory(5);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [(PSURLControllerHandler *)self delegate];
        v19 = NSStringFromSelector(sel_handleURL_);
        *(_DWORD *)buf = 136446978;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        __int16 v128 = 2160;
        uint64_t v129 = 1752392040;
        __int16 v130 = 2112;
        uint64_t v131 = (uint64_t)v18;
        __int16 v132 = 2114;
        *(void *)v133 = v19;
        _os_log_impl(&dword_1A6597000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate '%{mask.hash}@' implements %{public}@.", buf, 0x2Au);
      }
      v20 = [(PSURLControllerHandler *)self delegate];
      [v20 handleURL:v6];
    }
    v11 = [v6 objectForKey:@"path"];
    v21 = (void *)MEMORY[0x1E4F1CA48];
    v22 = [v11 pathComponents];
    v23 = [v21 arrayWithArray:v22];

    if (![v23 count])
    {
      v67 = PKLogForCategory(5);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v68 = [(PSURLControllerHandler *)self delegate];
        *(_DWORD *)buf = 136446722;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        __int16 v128 = 2160;
        uint64_t v129 = 1752392040;
        __int16 v130 = 2112;
        uint64_t v131 = (uint64_t)v68;
        _os_log_impl(&dword_1A6597000, v67, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate '%{mask.hash}@' no path components to process calling completion if set and bailing.", buf, 0x20u);
      }
      [(PSURLControllerHandler *)self _performCompletionAfterActiveTransitionCompletes:v7];
      v69 = [v6 objectForKeyedSubscript:@"pptTestName"];
      if (!v69) {
        goto LABEL_120;
      }
      v70 = [(PSURLControllerHandler *)self delegate];
      char v71 = objc_opt_respondsToSelector();

      if ((v71 & 1) == 0) {
        goto LABEL_120;
      }
      v72 = [(PSURLControllerHandler *)self delegate];
      [v72 handleScrollPPTTestName:v69];
LABEL_119:

LABEL_120:
      goto LABEL_121;
    }
    uint64_t v24 = [v23 objectAtIndexedSubscript:0];
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    if ((unint64_t)[v23 count] >= 2)
    {
      uint64_t v26 = [v23 objectAtIndexedSubscript:1];
      v27 = SFObjectAndOffsetForURLPair();
      uint64_t v25 = [v27 objectForKeyedSubscript:@"object"];
    }
    v124 = (void *)v25;
    v122 = (void *)v26;
    [v23 removeObjectAtIndex:0];
    v121 = (void *)v24;
    v28 = SFObjectAndOffsetForURLPair();
    uint64_t v29 = [v28 objectForKey:@"object"];
    v30 = [v28 objectForKey:@"offsetValue"];
    [v30 floatValue];
    float v32 = v31;

    v120 = v28;
    uint64_t v123 = [v28 objectForKey:@"offsetItem"];
    v33 = [(PSURLControllerHandler *)self delegate];
    v119 = (void *)v29;
    v34 = [v33 specifierForID:v29];

    v35 = [v6 objectForKeyedSubscript:@"animate"];
    int v118 = [v35 BOOLValue];

    if (!v34) {
      goto LABEL_56;
    }
    uint64_t v36 = [v34 propertyForKey:@"enabled"];
    if (v36)
    {
      v37 = (void *)v36;
      v38 = [v34 propertyForKey:@"enabled"];
      int v39 = [v38 BOOLValue];

      if (!v39)
      {
LABEL_56:
        v73 = PKLogForCategory(5);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
          __int16 v128 = 2160;
          uint64_t v129 = 1752392040;
          __int16 v130 = 2112;
          uint64_t v131 = (uint64_t)v34;
          _os_log_impl(&dword_1A6597000, v73, OS_LOG_TYPE_DEFAULT, "%{public}s: Specifier %{mask.hash}@ cannot handle URL (either nil or disabled), calling completion and bailing.", buf, 0x20u);
        }

        objc_opt_class();
        v74 = [(PSURLControllerHandler *)self delegate];
        if (objc_opt_isKindOfClass()) {
          v75 = v74;
        }
        else {
          v75 = 0;
        }
        id v47 = v75;

        v76 = (void *)v123;
        if (v123) {
          BOOL v77 = 0;
        }
        else {
          BOOL v77 = v32 == 0.0;
        }
        if (!v77 && v47)
        {
          v78 = PKLogForCategory(5);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
            _os_log_impl(&dword_1A6597000, v78, OS_LOG_TYPE_DEFAULT, "%{public}s: delegate has pending scroll/highlight operation to perform.", buf, 0xCu);
          }

          if (v32 == 0.0)
          {
            [(PSURLControllerHandler *)self _performScrollingAndHighlightingOperationsOnController:v47 withOffset:0 scrollTargetIdentifier:v123];
          }
          else
          {
            *(float *)&double v79 = v32;
            v80 = [NSNumber numberWithFloat:v79];
            [(PSURLControllerHandler *)self _performScrollingAndHighlightingOperationsOnController:v47 withOffset:v80 scrollTargetIdentifier:v123];
          }
        }
        [(PSURLControllerHandler *)self _performCompletionAfterActiveTransitionCompletes:v7];
        goto LABEL_118;
      }
    }
    id WeakRetained = objc_loadWeakRetained(v34 + 1);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v42 = PKLogForCategory(5);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = (objc_class *)objc_opt_class();
        v44 = NSStringFromClass(v43);
        *(_DWORD *)buf = 136446978;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        __int16 v128 = 2160;
        uint64_t v129 = 1752392040;
        __int16 v130 = 2112;
        uint64_t v131 = (uint64_t)v34;
        __int16 v132 = 2114;
        *(void *)v133 = v44;
        _os_log_impl(&dword_1A6597000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s: Specifier %{mask.hash}@ has target that is a %{public}@, calling load.", buf, 0x2Au);
      }
      id v45 = objc_loadWeakRetained(v34 + 1);
      [v45 load];
    }
    v46 = [(PSURLControllerHandler *)self delegate];
    id v47 = [v46 selectSpecifier:v34];

    [v47 loadViewIfNeeded];
    v48 = PKLogForCategory(5);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = [(PSURLControllerHandler *)self delegate];
      *(_DWORD *)buf = 136447746;
      v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
      __int16 v128 = 2160;
      uint64_t v129 = 1752392040;
      __int16 v130 = 2112;
      uint64_t v131 = (uint64_t)v49;
      __int16 v132 = 2160;
      *(void *)v133 = 1752392040;
      *(_WORD *)&v133[8] = 2112;
      *(void *)&v133[10] = v47;
      *(_WORD *)&v133[18] = 2160;
      *(void *)&v133[20] = 1752392040;
      *(_WORD *)&v133[28] = 2112;
      *(void *)&v133[30] = v34;
      _os_log_impl(&dword_1A6597000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate '%{mask.hash}@' returned target controller %{mask.hash}@ for specifier %{mask.hash}@", buf, 0x48u);
    }
    objc_opt_class();
    v50 = [(PSURLControllerHandler *)self delegate];
    if (objc_opt_isKindOfClass()) {
      v51 = v50;
    }
    else {
      v51 = 0;
    }
    id v52 = v51;

    v117 = v52;
    if ([v52 isURLHandlingDeferredForViewControllerContainment]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v53 = PKLogForCategory(5);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v111 = [(PSURLControllerHandler *)self delegate];
        v114 = NSStringFromSelector(sel_isURLHandlingDeferredForViewControllerContainment);
        *(_DWORD *)buf = 136447490;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        __int16 v128 = 2160;
        uint64_t v129 = 1752392040;
        __int16 v130 = 2112;
        uint64_t v131 = (uint64_t)v111;
        __int16 v132 = 2114;
        *(void *)v133 = v114;
        *(_WORD *)&v133[8] = 2160;
        *(void *)&v133[10] = 1752392040;
        *(_WORD *)&v133[18] = 2112;
        *(void *)&v133[20] = v47;
        _os_log_impl(&dword_1A6597000, v53, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate '%{mask.hash}@' has %{public}@ set, setting on target controller %{mask.hash}@.", buf, 0x3Eu);
      }
      objc_msgSend(v47, "setUrlHandlingDeferredForViewControllerContainment:", objc_msgSend(v52, "isURLHandlingDeferredForViewControllerContainment"));
    }
    if (v47 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v34 setProperty:v6 forKey:@"URLDictionary"];
      objc_opt_class();
      char v115 = objc_opt_isKindOfClass();
      if ((v115 & 1) == 0)
      {
        v54 = PKLogForCategory(5);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v112 = objc_opt_class();
          v55 = [(PSURLControllerHandler *)self delegate];
          v56 = [v55 rootController];
          *(_DWORD *)buf = 136447490;
          v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
          __int16 v128 = 2160;
          uint64_t v129 = 1752392040;
          __int16 v130 = 2112;
          uint64_t v131 = (uint64_t)v47;
          __int16 v132 = 2114;
          *(void *)v133 = v112;
          *(_WORD *)&v133[8] = 2160;
          *(void *)&v133[10] = 1752392040;
          *(_WORD *)&v133[18] = 2112;
          *(void *)&v133[20] = v56;
          _os_log_impl(&dword_1A6597000, v54, OS_LOG_TYPE_DEFAULT, "%{public}s: Target controller %{mask.hash}@ is not a %{public}@, setting rootController to %{mask.hash}@.", buf, 0x3Eu);
        }
        v57 = [(PSURLControllerHandler *)self delegate];
        v58 = [v57 rootController];
        [v47 setRootController:v58];
      }
      v59 = [(PSURLControllerHandler *)self delegate];
      char v60 = objc_opt_respondsToSelector();

      if (v60)
      {
        v61 = PKLogForCategory(5);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = NSStringFromSelector(sel_isShowingSetupController);
          v63 = [(PSURLControllerHandler *)self delegate];
          *(_DWORD *)buf = 136447234;
          v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
          __int16 v128 = 2114;
          uint64_t v129 = (uint64_t)v62;
          __int16 v130 = 2160;
          uint64_t v131 = 1752392040;
          __int16 v132 = 2112;
          *(void *)v133 = v63;
          *(_WORD *)&v133[8] = 1024;
          *(_DWORD *)&v133[10] = v115 & 1;
          _os_log_impl(&dword_1A6597000, v61, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting %{public}@ on delegate %{mask.hash}@ to %{BOOL}d.", buf, 0x30u);
        }
        v64 = [(PSURLControllerHandler *)self delegate];
        [v64 setShowingSetupController:v115 & 1];
      }
      v65 = [v6 objectForKeyedSubscript:@"fromSearch"];
      if ([v65 BOOLValue])
      {

        goto LABEL_76;
      }
      char v83 = [v47 canBeShownFromSuspendedState];

      if (v83)
      {
LABEL_76:
        if (v32 == 0.0)
        {
          if (v123) {
            v86 = (void *)v123;
          }
          else {
            v86 = v124;
          }
          [(PSURLControllerHandler *)self _performScrollingAndHighlightingOperationsOnController:v47 withOffset:0 scrollTargetIdentifier:v86];
        }
        else
        {
          *(float *)&double v66 = v32;
          v84 = [NSNumber numberWithFloat:v66];
          if (v123) {
            v85 = (void *)v123;
          }
          else {
            v85 = v124;
          }
          [(PSURLControllerHandler *)self _performScrollingAndHighlightingOperationsOnController:v47 withOffset:v84 scrollTargetIdentifier:v85];
        }
        v87 = [(PSURLControllerHandler *)self delegate];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v88 = [(PSURLControllerHandler *)self delegate];
          int v89 = [v88 conformsToProtocol:&unk_1EFB7BC28];

          if (!v89) {
            goto LABEL_91;
          }
          v90 = PKLogForCategory(5);
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            v91 = [(PSURLControllerHandler *)self delegate];
            *(_DWORD *)buf = 136447234;
            v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
            __int16 v128 = 2160;
            uint64_t v129 = 1752392040;
            __int16 v130 = 2112;
            uint64_t v131 = (uint64_t)v91;
            __int16 v132 = 2160;
            *(void *)v133 = 1752392040;
            *(_WORD *)&v133[8] = 2112;
            *(void *)&v133[10] = v47;
            _os_log_impl(&dword_1A6597000, v90, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting delegate %{mask.hash}@ as parentController for target controller %{mask.hash}@.", buf, 0x34u);
          }
          v87 = [(PSURLControllerHandler *)self delegate];
          [v47 setParentController:v87];
        }

LABEL_91:
        [v47 setSpecifier:v34];
        uint64_t v92 = [NSString pathWithComponents:v23];

        v116 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
        [v116 setObject:v92 forKey:@"path"];
        unsigned __int8 v125 = 0;
        v113 = v92;
        if ([v23 count] && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v93 = PKLogForCategory(5);
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            v94 = NSStringFromSelector(sel_prepareHandlingURLForSpecifierID_resourceDictionary_animatePush_);
            *(_DWORD *)buf = 136446978;
            v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
            __int16 v128 = 2160;
            uint64_t v129 = 1752392040;
            __int16 v130 = 2112;
            uint64_t v131 = (uint64_t)v47;
            __int16 v132 = 2114;
            *(void *)v133 = v94;
            _os_log_impl(&dword_1A6597000, v93, OS_LOG_TYPE_DEFAULT, "%{public}s: Target controller %{mask.hash}@ responds to %{public}@", buf, 0x2Au);
          }
          v95 = SFObjectAndOffsetForURLPair();
          v96 = [v95 objectForKeyedSubscript:@"object"];
          if (v96)
          {
            v109 = v96;
            unsigned int v97 = [v47 prepareHandlingURLForSpecifierID:v96 resourceDictionary:v116 animatePush:&v125 withCompletion:v7] ^ 1;
            v98 = PKLogForCategory(5);
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(sel_prepareHandlingURLForSpecifierID_resourceDictionary_animatePush_);
              v100 = v99 = v95;
              *(_DWORD *)buf = 136447746;
              v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
              __int16 v128 = 2160;
              uint64_t v129 = 1752392040;
              __int16 v130 = 2112;
              uint64_t v131 = (uint64_t)v47;
              __int16 v132 = 1024;
              *(_DWORD *)v133 = v97;
              *(_WORD *)&v133[4] = 2114;
              *(void *)&v133[6] = v100;
              *(_WORD *)&v133[14] = 2160;
              *(void *)&v133[16] = 1752392040;
              *(_WORD *)&v133[24] = 2112;
              *(void *)&v133[26] = v109;
              _os_log_impl(&dword_1A6597000, v98, OS_LOG_TYPE_DEFAULT, "%{public}s: Target controller %{mask.hash}@ returned %{BOOL}d from %{public}@ for specifier identifier %{mask.hash}@", buf, 0x44u);

              v95 = v99;
            }

            v96 = v109;
          }
          else
          {
            unsigned int v97 = 0;
          }

          if (v125) {
            uint64_t v101 = v97;
          }
          else {
            uint64_t v101 = 0;
          }
          int v102 = v97;
        }
        else
        {
          uint64_t v101 = 0;
          int v102 = 0;
        }
        if ((v101 & 1) == 0 && ((v118 ^ 1) & 1) == 0) {
          uint64_t v101 = [v23 count] == 0;
        }
        v103 = PKLogForCategory(5);
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          v104 = [(PSURLControllerHandler *)self delegate];
          int v110 = v102;
          int v102 = v125;
          uint64_t v105 = [v23 count];
          *(_DWORD *)buf = 136448514;
          v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
          __int16 v128 = 2160;
          uint64_t v129 = 1752392040;
          __int16 v130 = 2112;
          uint64_t v131 = (uint64_t)v104;
          __int16 v132 = 2160;
          *(void *)v133 = 1752392040;
          *(_WORD *)&v133[8] = 2112;
          *(void *)&v133[10] = v47;
          *(_WORD *)&v133[18] = 1024;
          *(_DWORD *)&v133[20] = v101;
          *(_WORD *)&v133[24] = 1024;
          *(_DWORD *)&v133[26] = v102;
          LOBYTE(v102) = v110;
          *(_WORD *)&v133[30] = 1024;
          *(_DWORD *)&v133[32] = v110;
          *(_WORD *)&v133[36] = 1024;
          int v134 = v118;
          __int16 v135 = 1024;
          BOOL v136 = v105 == 0;
          _os_log_impl(&dword_1A6597000, v103, OS_LOG_TYPE_DEFAULT, "%{public}s: Requesting delegate %{mask.hash}@ show target controller %{mask.hash}@ with animation resolved to %{BOOL}d ((controllerWantsAnimation: %{BOOL}d && deferHandleURL: %{BOOL}d) || (animate: %{BOOL}d && pathComponents.count == 0: %{BOOL}d))", buf, 0x52u);
        }
        v106 = [(PSURLControllerHandler *)self delegate];
        [v106 showController:v47 animate:v101];

        if ((v102 & 1) == 0)
        {
          v107 = PKLogForCategory(5);
          if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
          {
            v108 = NSStringFromSelector(sel_handleURL_withCompletion_);
            *(_DWORD *)buf = 136447490;
            v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
            __int16 v128 = 2114;
            uint64_t v129 = (uint64_t)v108;
            __int16 v130 = 2160;
            uint64_t v131 = 1752392040;
            __int16 v132 = 2112;
            *(void *)v133 = v47;
            *(_WORD *)&v133[8] = 2160;
            *(void *)&v133[10] = 1752392040;
            *(_WORD *)&v133[18] = 2112;
            *(void *)&v133[20] = v116;
            _os_log_impl(&dword_1A6597000, v107, OS_LOG_TYPE_DEFAULT, "%{public}s: Calling %{public}@ on target controller %{mask.hash}@ with new resource dictionary %{mask.hash}@", buf, 0x3Eu);
          }
          [v47 handleURL:v116 withCompletion:v7];
        }

        v11 = v113;
        goto LABEL_117;
      }
      v81 = PKLogForCategory(5);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        __int16 v128 = 2160;
        uint64_t v129 = 1752392040;
        __int16 v130 = 2112;
        uint64_t v131 = (uint64_t)v47;
        _os_log_impl(&dword_1A6597000, v81, OS_LOG_TYPE_DEFAULT, "%{public}s: Target controller %{mask.hash}@ cannot be shown from suspended state, calling completion if set and bailing.", buf, 0x20u);
      }
    }
    else
    {
      v81 = PKLogForCategory(5);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        v82 = [(PSURLControllerHandler *)self delegate];
        *(_DWORD *)buf = 136447746;
        v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
        __int16 v128 = 2160;
        uint64_t v129 = 1752392040;
        __int16 v130 = 2112;
        uint64_t v131 = (uint64_t)v82;
        __int16 v132 = 2160;
        *(void *)v133 = 1752392040;
        *(_WORD *)&v133[8] = 2112;
        *(void *)&v133[10] = v47;
        *(_WORD *)&v133[18] = 2160;
        *(void *)&v133[20] = 1752392040;
        *(_WORD *)&v133[28] = 2112;
        *(void *)&v133[30] = v34;
        _os_log_impl(&dword_1A6597000, v81, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate '%{mask.hash}@' returned %{mask.hash}@ for specifier %{mask.hash}@ which is not a UIViewController class, calling completion if set and bailing.", buf, 0x48u);
      }
    }

    [(PSURLControllerHandler *)self _performCompletionAfterActiveTransitionCompletes:v7];
LABEL_117:
    v76 = (void *)v123;

LABEL_118:
    v69 = v121;
    v72 = v122;
    goto LABEL_119;
  }
  v10 = (void *)MEMORY[0x1E4F1CC08];
  if (v6) {
    v10 = v6;
  }
  v11 = v10;
  char v12 = [(id)_applicationStateProvider shouldContinueActiveURLRoutingForURLResourceDictionary:v11];
  v13 = PKLogForCategory(5);
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136447234;
      v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
      __int16 v128 = 2160;
      uint64_t v129 = 1752392040;
      __int16 v130 = 2112;
      uint64_t v131 = _applicationStateProvider;
      __int16 v132 = 2160;
      *(void *)v133 = 1752392040;
      *(_WORD *)&v133[8] = 2112;
      *(void *)&v133[10] = v6;
      _os_log_impl(&dword_1A6597000, v14, OS_LOG_TYPE_INFO, "%{public}s: State provider '%{mask.hash}@' has indicated URL routing should continue for URL resource dictionary %{mask.hash}@.", buf, 0x34u);
    }

    goto LABEL_12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v127 = "-[PSURLControllerHandler handleURL:withCompletion:]";
    __int16 v128 = 2160;
    uint64_t v129 = 1752392040;
    __int16 v130 = 2112;
    uint64_t v131 = _applicationStateProvider;
    __int16 v132 = 2160;
    *(void *)v133 = 1752392040;
    *(_WORD *)&v133[8] = 2112;
    *(void *)&v133[10] = v6;
    _os_log_impl(&dword_1A6597000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: State provider '%{mask.hash}@' has indicated URL routing should stop for URL resource dictionary %{mask.hash}@. Calling completion handler if set and bailing.", buf, 0x34u);
  }

  [(PSURLControllerHandler *)self _performCompletionAfterActiveTransitionCompletes:v7];
LABEL_121:
}

- (void)_performCompletionAfterActiveTransitionCompletes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  v5 = [(PSURLControllerHandler *)self delegate];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__PSURLControllerHandler__performCompletionAfterActiveTransitionCompletes___block_invoke;
  v16[3] = &unk_1E5C5D938;
  id v8 = v4;
  id v17 = v8;
  v9 = (void (**)(void))MEMORY[0x1AD0BE2A0](v16);
  if (v7)
  {
    v10 = [v7 navigationController];
    v11 = [v10 transitionCoordinator];

    if (v11)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __75__PSURLControllerHandler__performCompletionAfterActiveTransitionCompletes___block_invoke_3;
      v14[3] = &unk_1E5C60408;
      v15 = v9;
      [v11 animateAlongsideTransition:&__block_literal_global_32 completion:v14];
    }
    else
    {
      v13 = PKLogForCategory(5);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v19 = "-[PSURLControllerHandler _performCompletionAfterActiveTransitionCompletes:]";
        _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: Calling Completion Handler (no active transition).", buf, 0xCu);
      }

      v9[2](v9);
    }
  }
  else
  {
    char v12 = PKLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v19 = "-[PSURLControllerHandler _performCompletionAfterActiveTransitionCompletes:]";
      _os_log_impl(&dword_1A6597000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Calling Completion Handler (delegate not a View Controller).", buf, 0xCu);
    }

    v9[2](v9);
  }
}

uint64_t __75__PSURLControllerHandler__performCompletionAfterActiveTransitionCompletes___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __75__PSURLControllerHandler__performCompletionAfterActiveTransitionCompletes___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = PKLogForCategory(5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    v5 = "-[PSURLControllerHandler _performCompletionAfterActiveTransitionCompletes:]_block_invoke_3";
    _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: Calling Completion Handler (after transition complete).", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performScrollingAndHighlightingOperationsOnController:(id)a3 withOffset:(id)a4 scrollTargetIdentifier:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = &unk_1EFB7E2E0;
  if ([v7 conformsToProtocol:v10]) {
    v11 = v7;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    if (v8)
    {
      v13 = PKLogForCategory(5);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136446978;
        v21 = "-[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:]";
        __int16 v22 = 2114;
        uint64_t v23 = (uint64_t)v8;
        __int16 v24 = 2160;
        uint64_t v25 = 1752392040;
        __int16 v26 = 2112;
        uint64_t v27 = (uint64_t)v12;
        _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting scrollOffset to %{public}@ on Target controller %{mask.hash}@.", (uint8_t *)&v20, 0x2Au);
      }

      [v8 floatValue];
      objc_msgSend(v12, "setDesiredVerticalContentOffset:");
    }
    else
    {
      uint64_t v14 = [v9 length];
      v15 = PKLogForCategory(5);
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          int v20 = 136447234;
          v21 = "-[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:]";
          __int16 v22 = 2160;
          uint64_t v23 = 1752392040;
          __int16 v24 = 2112;
          uint64_t v25 = (uint64_t)v9;
          __int16 v26 = 2160;
          uint64_t v27 = 1752392040;
          __int16 v28 = 2112;
          id v29 = v12;
          _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting scrollTarget to %{mask.hash}@ on Target controller %{mask.hash}@.", (uint8_t *)&v20, 0x34u);
        }

        [v12 setDesiredVerticalContentOffsetItemNamed:v9];
      }
      else
      {
        if (v16)
        {
          int v20 = 136446722;
          v21 = "-[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:]";
          __int16 v22 = 2160;
          uint64_t v23 = 1752392040;
          __int16 v24 = 2112;
          uint64_t v25 = (uint64_t)v12;
          _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s: No offset to set on Target controller %{mask.hash}@.", (uint8_t *)&v20, 0x20u);
        }
      }
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [v9 length];
    v18 = PKLogForCategory(5);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        int v20 = 136447234;
        v21 = "-[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:]";
        __int16 v22 = 2160;
        uint64_t v23 = 1752392040;
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v9;
        __int16 v26 = 2160;
        uint64_t v27 = 1752392040;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl(&dword_1A6597000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting highlight target to %{mask.hash}@ on Target controller %{mask.hash}@.", (uint8_t *)&v20, 0x34u);
      }

      [v7 highlightSpecifierWithID:v9];
    }
    else
    {
      if (v19)
      {
        int v20 = 136446722;
        v21 = "-[PSURLControllerHandler _performScrollingAndHighlightingOperationsOnController:withOffset:scrollTargetIdentifier:]";
        __int16 v22 = 2160;
        uint64_t v23 = 1752392040;
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v7;
        _os_log_impl(&dword_1A6597000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s: No highlight target to set on Target controller %{mask.hash}@.", (uint8_t *)&v20, 0x20u);
      }
    }
  }
}

- (PSURLControllerHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSURLControllerHandlerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end