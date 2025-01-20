@interface _SFAccessPolicy
+ (BOOL)supportsSecureCoding;
+ (id)accessPolicyWithSecAccessibility:(__CFString *)a3 error:(id *)a4;
- ($909E7E1822DED34025FCFF16911CCF70)accessibility;
- (BOOL)isEqual:(id)a3;
- (NSArray)accessControlList;
- (NSString)accessGroup;
- (_SFAccessPolicy)init;
- (_SFAccessPolicy)initWithAccessibility:(id *)a3 sharingPolicy:(int64_t)a4;
- (_SFAccessPolicy)initWithCoder:(id)a3;
- (__CFDictionary)secAccessibilityAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)sharingPolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessControlList:(id)a3;
- (void)setAccessGroup:(id)a3;
- (void)setAccessibility:(id *)a3;
- (void)setSharingPolicy:(int64_t)a3;
@end

@implementation _SFAccessPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)accessPolicyWithSecAccessibility:(__CFString *)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F3B5B0]))
  {
    uint64_t v7 = 2;
LABEL_3:
    uint64_t v8 = 1;
LABEL_6:
    long long v16 = 0uLL;
    uint64_t v14 = v8;
    long long v15 = 0uLL;
    v9 = (void *)[objc_alloc((Class)a1) initWithAccessibility:&v14 sharingPolicy:v7];
    goto LABEL_7;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F3B570]))
  {
    uint64_t v8 = 0;
    uint64_t v7 = 2;
    goto LABEL_6;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F3B5B8]))
  {
    uint64_t v7 = 0;
    goto LABEL_3;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F3B578]))
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  if (a4)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v12 = [NSString stringWithFormat:@"invalid secAccessibility for SFAccessPolicy: %@", a3];
    v18[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a4 = [v11 errorWithDomain:@"SFKeychainErrorDomain" code:10 userInfo:v13];
  }
  v9 = 0;
LABEL_7:
  return v9;
}

- (_SFAccessPolicy)init
{
  v3[1] = 0;
  v3[2] = 0;
  v3[0] = 1;
  return [(_SFAccessPolicy *)self initWithAccessibility:v3 sharingPolicy:2];
}

- (_SFAccessPolicy)initWithAccessibility:(id *)a3 sharingPolicy:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_SFAccessPolicy;
  result = [(_SFAccessPolicy *)&v8 init];
  if (result)
  {
    int64_t var1 = a3->var1.var1;
    *(_OWORD *)&result->_accessibility.mode = *(_OWORD *)&a3->var0;
    result->_accessibility.authenticationPolicy.subsetCount = var1;
    result->_sharingPolicy = a4;
  }
  return result;
}

- (_SFAccessPolicy)initWithCoder:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFAccessPolicy;
  v5 = [(_SFAccessPolicy *)&v15 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"SFAccessPolicyAccessibilityMode"]) {
      uint64_t v6 = [v4 decodeIntegerForKey:@"SFAccessPolicyAccessibilityMode"];
    }
    else {
      uint64_t v6 = -1;
    }
    if (![v4 containsValueForKey:@"SFAccessPolicySharingMode"]
      || (uint64_t v7 = [v4 decodeIntegerForKey:@"SFAccessPolicySharingMode"], v6 < 0)
      || v7 < 0)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      v17[0] = @"failed to deserialize SFAccessPolicy instance";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      v13 = [v11 errorWithDomain:@"SFKeychainErrorDomain" code:4 userInfo:v12];
      [v4 failWithError:v13];

      v10 = 0;
      goto LABEL_11;
    }
    v5->_accessibility.mode = v6;
    v5->_accessibility.authenticationPolicy.authenticationRequirements = 0;
    v5->_accessibility.authenticationPolicy.subsetCount = 0;
    v5->_sharingPolicy = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFAccessPolicyAccessGroup"];
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v8;
  }
  v10 = v5;
LABEL_11:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_accessibility.mode forKey:@"SFAccessPolicyAccessibilityMode"];
  [v5 encodeInteger:self->_sharingPolicy forKey:@"SFAccessPolicySharingMode"];
  accessGroup = self->_accessGroup;
  if (accessGroup) {
    [v5 encodeObject:accessGroup forKey:@"SFAccessPolicyAccessGroup"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  long long v8 = *(_OWORD *)&self->_accessibility.mode;
  int64_t sharingPolicy = self->_sharingPolicy;
  int64_t subsetCount = self->_accessibility.authenticationPolicy.subsetCount;
  uint64_t v6 = (void *)[v4 initWithAccessibility:&v8 sharingPolicy:sharingPolicy];
  [v6 setAccessGroup:self->_accessGroup];
  [v6 setAccessControlList:self->_accessControlList];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_SFAccessPolicy *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        int64_t mode = self->_accessibility.mode;
        [(_SFAccessPolicy *)v6 accessibility];
        if (mode == v14
          && (int64_t sharingPolicy = (void *)self->_sharingPolicy,
              sharingPolicy == (void *)[(_SFAccessPolicy *)v6 sharingPolicy]))
        {
          accessGroup = self->_accessGroup;
          v10 = accessGroup;
          if (!accessGroup)
          {
            int64_t sharingPolicy = [(_SFAccessPolicy *)v6 accessGroup];
            if (!sharingPolicy)
            {
              char v12 = 1;
LABEL_17:

              goto LABEL_14;
            }
            v10 = self->_accessGroup;
          }
          v11 = [(_SFAccessPolicy *)v6 accessGroup];
          char v12 = [(NSString *)v10 isEqualToString:v11];

          if (!accessGroup) {
            goto LABEL_17;
          }
        }
        else
        {
          char v12 = 0;
        }
LABEL_14:

        goto LABEL_15;
      }
    }
    char v12 = 0;
  }
LABEL_15:

  return v12;
}

- (__CFDictionary)secAccessibilityAttributes
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  id v4 = Mutable;
  int64_t sharingPolicy = self->_sharingPolicy;
  if (sharingPolicy)
  {
    if (sharingPolicy != 1)
    {
      if (sharingPolicy != 2) {
        goto LABEL_16;
      }
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F1CFD0]);
    }
    int64_t mode = self->_accessibility.mode;
    if (!mode)
    {
      uint64_t v7 = (const void **)MEMORY[0x1E4F3B570];
      goto LABEL_15;
    }
    if (mode == 1)
    {
      uint64_t v7 = (const void **)MEMORY[0x1E4F3B5B0];
LABEL_15:
      CFDictionaryAddValue(v4, (const void *)*MEMORY[0x1E4F3B558], *v7);
      goto LABEL_16;
    }
  }
  else
  {
    int64_t mode = self->_accessibility.mode;
    if (!mode)
    {
      uint64_t v7 = (const void **)MEMORY[0x1E4F3B578];
      goto LABEL_15;
    }
    if (mode == 1)
    {
      uint64_t v7 = (const void **)MEMORY[0x1E4F3B5B8];
      goto LABEL_15;
    }
  }
  if (mode == 2)
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"SFAccessPolicy does not support SFAccessibleWithAuthentication at present - please file a radar if you need it" userInfo:0];
    objc_exception_throw(v8);
  }
LABEL_16:
  CFAutorelease(v4);
  return v4;
}

- ($909E7E1822DED34025FCFF16911CCF70)accessibility
{
  *($FE5126324A5092C0FD3D5E3C997958B5 *)retstr = *($FE5126324A5092C0FD3D5E3C997958B5 *)&self->var1.var0;
  return self;
}

- (void)setAccessibility:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_accessibility.authenticationPolicy.int64_t subsetCount = a3->var1.var1;
  *(_OWORD *)&self->_accessibility.int64_t mode = v3;
}

- (int64_t)sharingPolicy
{
  return self->_sharingPolicy;
}

- (void)setSharingPolicy:(int64_t)a3
{
  self->_int64_t sharingPolicy = a3;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
}

- (NSArray)accessControlList
{
  return self->_accessControlList;
}

- (void)setAccessControlList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessControlList, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

@end