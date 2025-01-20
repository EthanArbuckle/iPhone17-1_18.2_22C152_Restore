@interface NTKComplicationTemplateReference
+ (BOOL)supportsSecureCoding;
- (CLKComplicationTemplate)complicationTemplate;
- (NSString)path;
- (NTKComplicationTemplateReference)initWithCoder:(id)a3;
- (NTKComplicationTemplateReference)initWithPath:(id)a3 existingTemplate:(id)a4;
- (id)_lock_complicationTemplate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKComplicationTemplateReference

- (NTKComplicationTemplateReference)initWithPath:(id)a3 existingTemplate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKComplicationTemplateReference;
  v8 = [(NTKComplicationTemplateReference *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    path = v8->_path;
    v8->_path = (NSString *)v9;

    objc_storeWeak((id *)&v8->_cachedTemplate, v7);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (CLKComplicationTemplate)complicationTemplate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NTKComplicationTemplateReference *)self _lock_complicationTemplate];
  os_unfair_lock_unlock(p_lock);
  return (CLKComplicationTemplate *)v4;
}

- (id)_lock_complicationTemplate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedTemplate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    path = self->_path;
    id v14 = 0;
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:path options:0 error:&v14];
    id v8 = v14;
    if (v7)
    {
      id v13 = v8;
      uint64_t v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v13];
      id v10 = v13;

      if (v9)
      {
        objc_storeWeak((id *)&self->_cachedTemplate, v9);
        uint64_t v9 = v9;
        v5 = v9;
      }
      else
      {
        v11 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v16 = self;
          __int16 v17 = 2112;
          id v18 = v10;
          _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "NTKComplicationTemplateReference %p: failed to decode template: %@", buf, 0x16u);
        }

        v5 = 0;
      }
    }
    else
    {
      uint64_t v9 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v16 = self;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "NTKComplicationTemplateReference %p: failed to load data: %@", buf, 0x16u);
      }
      v5 = 0;
      id v10 = v8;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationTemplateReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];

  id v6 = [(NTKComplicationTemplateReference *)self initWithPath:v5 existingTemplate:0];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_cachedTemplate);
}

@end