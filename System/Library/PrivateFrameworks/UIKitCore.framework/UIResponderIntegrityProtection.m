@interface UIResponderIntegrityProtection
@end

@implementation UIResponderIntegrityProtection

void __38___UIResponderIntegrityProtection_rip__block_invoke()
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v1 = _UIInternalPreference_ResponderIntegrityProtection;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ResponderIntegrityProtection)
    {
      while (v0 >= v1)
      {
        _UIInternalPreferenceSync(v0, &_UIInternalPreference_ResponderIntegrityProtection, @"ResponderIntegrityProtection", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v1 = _UIInternalPreference_ResponderIntegrityProtection;
        if (v0 == _UIInternalPreference_ResponderIntegrityProtection) {
          return;
        }
      }
      if (byte_1E8FD526C)
      {
        uint64_t v2 = objc_opt_new();
        v3 = (void *)_MergedGlobals_1066;
        _MergedGlobals_1066 = v2;

        int ClassList = objc_getClassList(0, 0);
        if (ClassList <= 0)
        {
          v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("ResponderIntegrityProtection", &qword_1EB260978) + 8);
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            return;
          }
          __int16 v20 = 0;
          v16 = (uint8_t *)&v20;
        }
        else
        {
          int v5 = ClassList;
          uint64_t v6 = ClassList;
          v7 = (Class *)malloc_type_calloc(ClassList, 8uLL, 0x80040B8603338uLL);
          if (v7)
          {
            v8 = v7;
            if (objc_getClassList(v7, v5) == v5)
            {
              uint64_t v9 = objc_opt_class();
              for (uint64_t i = 0; i != v6; ++i)
              {
                v11 = v8[i];
                BOOL v12 = v11 != 0;
                if (v11) {
                  BOOL v13 = v11 == (objc_class *)v9;
                }
                else {
                  BOOL v13 = 1;
                }
                if (!v13)
                {
                  Superclass = v8[i];
                  do
                  {
                    Superclass = class_getSuperclass(Superclass);
                    BOOL v12 = Superclass != 0;
                  }
                  while (Superclass && Superclass != (objc_class *)v9);
                }
                if (v12)
                {
                  _rip_inject_method(v11, sel_pressesBegan_withEvent_);
                  _rip_inject_method(v11, sel_pressesChanged_withEvent_);
                  _rip_inject_method(v11, sel_pressesEnded_withEvent_);
                  _rip_inject_method(v11, sel_pressesCancelled_withEvent_);
                }
              }
              free(v8);
            }
            else
            {
              v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("ResponderIntegrityProtection", &qword_1EB260988) + 8);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v18 = 0;
                _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Unable to fetch class list.", v18, 2u);
              }
              free(v8);
            }
            return;
          }
          v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("ResponderIntegrityProtection", &qword_1EB260980) + 8);
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            return;
          }
          *(_WORD *)buf = 0;
          v16 = buf;
        }
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Unable to fetch class list.", v16, 2u);
      }
    }
  }
}

@end