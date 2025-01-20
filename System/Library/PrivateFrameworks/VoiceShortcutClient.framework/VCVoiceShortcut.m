@interface VCVoiceShortcut
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBeenModified;
- (BOOL)isEqual:(id)a3;
- (INImage)keyImage;
- (INShortcut)shortcut;
- (NSDate)dateCreated;
- (NSDate)dateLastModified;
- (NSDate)lastRunDate;
- (NSNumber)runEventsCount;
- (NSString)associatedAppBundleIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)phrase;
- (NSString)shortcutDescription;
- (NSString)shortcutName;
- (VCVoiceShortcut)initWithCoder:(id)a3;
- (VCVoiceShortcut)initWithIdentifier:(id)a3 phrase:(id)a4 shortcutName:(id)a5 shortcutDescription:(id)a6 associatedAppBundleIdentifier:(id)a7 dateCreated:(id)a8 dateLastModified:(id)a9 lastRunDate:(id)a10 runEventsCount:(id)a11 shortcut:(id)a12 keyImageData:(id)a13 error:(id *)a14;
- (WFWorkflow)workflow;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VCVoiceShortcut

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRunDate, 0);
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_runEventsCount, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_keyImage, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutDescription, 0);
  objc_storeStrong((id *)&self->_shortcutName, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDate)lastRunDate
{
  return self->_lastRunDate;
}

- (NSDate)dateLastModified
{
  return self->_dateLastModified;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSNumber)runEventsCount
{
  return self->_runEventsCount;
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (INImage)keyImage
{
  return self->_keyImage;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (NSString)shortcutDescription
{
  return self->_shortcutDescription;
}

- (NSString)shortcutName
{
  return self->_shortcutName;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VCVoiceShortcut *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(VCVoiceShortcut *)self phrase];
  [v4 encodeObject:v6 forKey:@"phrase"];

  v7 = [(VCVoiceShortcut *)self shortcutName];
  [v4 encodeObject:v7 forKey:@"shortcutName"];

  v8 = [(VCVoiceShortcut *)self shortcutDescription];
  [v4 encodeObject:v8 forKey:@"shortcutDescription"];

  v9 = [(VCVoiceShortcut *)self associatedAppBundleIdentifier];
  [v4 encodeObject:v9 forKey:@"associatedAppBundleIdentifier"];

  v10 = [(VCVoiceShortcut *)self dateCreated];
  [v4 encodeObject:v10 forKey:@"dateCreated"];

  v11 = [(VCVoiceShortcut *)self dateLastModified];
  [v4 encodeObject:v11 forKey:@"dateLastModified"];

  v12 = [(VCVoiceShortcut *)self lastRunDate];
  [v4 encodeObject:v12 forKey:@"lastRunDate"];

  v13 = [(VCVoiceShortcut *)self runEventsCount];
  [v4 encodeObject:v13 forKey:@"runEventsCount"];

  v14 = [(VCVoiceShortcut *)self keyImage];
  v15 = [v14 _imageData];
  [v4 encodeObject:v15 forKey:@"keyImageData"];

  id v16 = [(VCVoiceShortcut *)self shortcut];
  [v4 encodeObject:v16 forKey:@"shortcut"];
}

- (VCVoiceShortcut)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phrase"];
  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutName"];
  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutDescription"];
  v7 = (void *)v5;
  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedAppBundleIdentifier"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateCreated"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateLastModified"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastRunDate"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runEventsCount"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcut"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyImageData"];

  v14 = 0;
  if (v7 && v6 && v22 && v8 && v9)
  {
    id v23 = 0;
    v15 = -[VCVoiceShortcut initWithIdentifier:phrase:shortcutName:shortcutDescription:associatedAppBundleIdentifier:dateCreated:dateLastModified:lastRunDate:runEventsCount:shortcut:keyImageData:error:](self, "initWithIdentifier:phrase:shortcutName:shortcutDescription:associatedAppBundleIdentifier:dateCreated:dateLastModified:lastRunDate:runEventsCount:shortcut:keyImageData:error:", v7, v9, v10, v11, v12, v13, &v23);
    id v16 = v23;
    if (v16)
    {
      v19 = v7;
      v17 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[VCVoiceShortcut initWithCoder:]";
        __int16 v26 = 2112;
        id v27 = v16;
        _os_log_impl(&dword_1B3C5C000, v17, OS_LOG_TYPE_ERROR, "%s Failed to construct a valid VoiceShortcut from coder: %@", buf, 0x16u);
      }

      v7 = v19;
    }
    self = v15;

    v14 = self;
  }

  return v14;
}

- (NSString)description
{
  id v16 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v3);
  v14 = [(VCVoiceShortcut *)self identifier];
  id v4 = [(VCVoiceShortcut *)self phrase];
  uint64_t v5 = [(VCVoiceShortcut *)self shortcutName];
  v6 = [(VCVoiceShortcut *)self shortcutDescription];
  v7 = [(VCVoiceShortcut *)self associatedAppBundleIdentifier];
  v8 = [(VCVoiceShortcut *)self dateCreated];
  v9 = [(VCVoiceShortcut *)self dateLastModified];
  v10 = [(VCVoiceShortcut *)self lastRunDate];
  v11 = [(VCVoiceShortcut *)self runEventsCount];
  v12 = [v16 stringWithFormat:@"<%@ %p\nidentifier: %@\nphrase: %@\nshortcutName: %@\nshortcutDescription: %@\nassociatedAppBundleIdentifier: %@\ndateCreated: %@\ndateLastModified: %@\nlastRunDate: %@\nrunEventsCount: %@>", v15, self, v14, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VCVoiceShortcut *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(VCVoiceShortcut *)self identifier];
      v7 = [(VCVoiceShortcut *)v5 identifier];
      if (![v6 isEqualToString:v7])
      {
        char v14 = 0;
LABEL_44:

        goto LABEL_45;
      }
      v8 = [(VCVoiceShortcut *)self phrase];
      v9 = [(VCVoiceShortcut *)v5 phrase];
      if (![v8 isEqualToString:v9])
      {
        char v14 = 0;
LABEL_43:

        goto LABEL_44;
      }
      v10 = [(VCVoiceShortcut *)self shortcutName];
      v11 = [(VCVoiceShortcut *)v5 shortcutName];
      if (![v10 isEqual:v11])
      {
        char v14 = 0;
LABEL_42:

        goto LABEL_43;
      }
      uint64_t v12 = [(VCVoiceShortcut *)self shortcutDescription];
      v47 = [(VCVoiceShortcut *)v5 shortcutDescription];
      v48 = (void *)v12;
      if ((void *)v12 == v47)
      {
        v46 = v10;
      }
      else
      {
        v13 = [(VCVoiceShortcut *)self shortcutDescription];
        v44 = [(VCVoiceShortcut *)v5 shortcutDescription];
        v45 = v13;
        if (![v13 isEqual:v44])
        {
          char v14 = 0;
          goto LABEL_40;
        }
        v46 = v10;
      }
      v15 = [(VCVoiceShortcut *)self associatedAppBundleIdentifier];
      id v16 = [(VCVoiceShortcut *)v5 associatedAppBundleIdentifier];
      if (![v15 isEqual:v16])
      {

        char v14 = 0;
        goto LABEL_39;
      }
      v41 = v11;
      v42 = v16;
      v43 = v15;
      v17 = [(VCVoiceShortcut *)self dateCreated];
      [(VCVoiceShortcut *)v5 dateCreated];
      v19 = v18 = v17;
      if (!objc_msgSend(v17, "isEqual:"))
      {
        char v14 = 0;
        v11 = v41;
LABEL_38:

LABEL_39:
        v10 = v46;
        if (v48 == v47)
        {
LABEL_41:

          goto LABEL_42;
        }
LABEL_40:

        goto LABEL_41;
      }
      v20 = [(VCVoiceShortcut *)self dateLastModified];
      v39 = [(VCVoiceShortcut *)v5 dateLastModified];
      v40 = v20;
      if (!objc_msgSend(v20, "isEqual:"))
      {
        char v14 = 0;
        v11 = v41;
LABEL_37:

        goto LABEL_38;
      }
      v21 = [(VCVoiceShortcut *)self lastRunDate];
      v37 = [(VCVoiceShortcut *)v5 lastRunDate];
      v38 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        char v14 = 0;
        v11 = v41;
LABEL_36:

        goto LABEL_37;
      }
      v22 = [(VCVoiceShortcut *)self runEventsCount];
      v35 = [(VCVoiceShortcut *)v5 runEventsCount];
      v36 = v22;
      if (!objc_msgSend(v22, "isEqual:"))
      {
        char v14 = 0;
        v11 = v41;
LABEL_35:

        goto LABEL_36;
      }
      uint64_t v23 = [(VCVoiceShortcut *)self shortcut];
      v33 = [(VCVoiceShortcut *)v5 shortcut];
      v34 = (void *)v23;
      BOOL v24 = v23 == (void)v33;
      v11 = v41;
      if (v24
        || ([(VCVoiceShortcut *)self shortcut],
            v31 = objc_claimAutoreleasedReturnValue(),
            [(VCVoiceShortcut *)v5 shortcut],
            v30 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v31, "isEqual:")))
      {
        v32 = [(VCVoiceShortcut *)self keyImage];
        uint64_t v25 = [(VCVoiceShortcut *)v5 keyImage];
        if (v32 == (void *)v25)
        {

          char v14 = 1;
        }
        else
        {
          v29 = (void *)v25;
          uint64_t v28 = [(VCVoiceShortcut *)self keyImage];
          id v27 = [(VCVoiceShortcut *)v5 keyImage];
          char v14 = [v28 isEqual:v27];
        }
        if (v34 == v33) {
          goto LABEL_34;
        }
      }
      else
      {
        char v14 = 0;
      }

LABEL_34:
      goto LABEL_35;
    }
    char v14 = 0;
  }
LABEL_45:

  return v14;
}

- (unint64_t)hash
{
  v3 = [(VCVoiceShortcut *)self identifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(VCVoiceShortcut *)self shortcut];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(VCVoiceShortcut *)self dateLastModified];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (WFWorkflow)workflow
{
  return 0;
}

- (BOOL)hasBeenModified
{
  v3 = [(VCVoiceShortcut *)self dateCreated];
  uint64_t v4 = [(VCVoiceShortcut *)self dateLastModified];
  BOOL v5 = [v3 compare:v4] == -1;

  return v5;
}

- (VCVoiceShortcut)initWithIdentifier:(id)a3 phrase:(id)a4 shortcutName:(id)a5 shortcutDescription:(id)a6 associatedAppBundleIdentifier:(id)a7 dateCreated:(id)a8 dateLastModified:(id)a9 lastRunDate:(id)a10 runEventsCount:(id)a11 shortcut:(id)a12 keyImageData:(id)a13 error:(id *)a14
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v64 = a6;
  id v23 = a7;
  id obj = a8;
  id v24 = a8;
  uint64_t v25 = v20;
  id v26 = v24;
  id v71 = a9;
  id v27 = self;
  id v67 = a10;
  id v66 = a11;
  id v28 = a12;
  id v65 = a13;
  v69 = v28;
  if (![v25 length])
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v55 = id v54 = v26;
    [v55 handleFailureInMethod:a2, self, @"VCVoiceShortcut.m", 46, @"Invalid parameter not satisfying: %@", @"identifier.length" object file lineNumber description];

    id v26 = v54;
    id v28 = v69;
  }
  if (![v21 length])
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v57 = id v56 = v26;
    [v57 handleFailureInMethod:a2, self, @"VCVoiceShortcut.m", 47, @"Invalid parameter not satisfying: %@", @"phrase.length" object file lineNumber description];

    id v26 = v56;
    id v28 = v69;
  }
  v70 = v22;
  if (![v22 length])
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v59 = id v58 = v26;
    [v59 handleFailureInMethod:a2, self, @"VCVoiceShortcut.m", 48, @"Invalid parameter not satisfying: %@", @"shortcutName.length" object file lineNumber description];

    id v26 = v58;
  }
  v68 = v26;
  if (!v26)
  {
    v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2, self, @"VCVoiceShortcut.m", 49, @"Invalid parameter not satisfying: %@", @"dateCreated" object file lineNumber description];
  }
  if (!v71)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2, self, @"VCVoiceShortcut.m", 50, @"Invalid parameter not satisfying: %@", @"dateLastModified" object file lineNumber description];
  }
  id v29 = v25;
  v30 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v29];
  if (v30)
  {
    id v31 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1001, @"(%@) is not a valid UUID string.", v29);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v32 = v31;
  if (v30)
  {
    if (![v23 length])
    {
      uint64_t v33 = [v28 _associatedAppBundleIdentifier];

      id v23 = (id)v33;
    }
    if (![v23 length])
    {
      v52 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v74 = "-[VCVoiceShortcut initWithIdentifier:phrase:shortcutName:shortcutDescription:associatedAppBundleIdentifier"
              ":dateCreated:dateLastModified:lastRunDate:runEventsCount:shortcut:keyImageData:error:]";
        __int16 v75 = 2114;
        v76 = v69;
        __int16 v77 = 2114;
        v78 = @"an associatedAppBundleIdentifier is required on the shortcut";
        _os_log_impl(&dword_1B3C5C000, v52, OS_LOG_TYPE_ERROR, "%s Failed to init VCVoiceShortcut with shortcut=%{public}@ because %{public}@", buf, 0x20u);
      }

      v47 = v65;
      if (a14)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1009, @"%@", @"an associatedAppBundleIdentifier is required on the shortcut");
        v50 = 0;
        *a14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v50 = 0;
      }
      v40 = v64;
      goto LABEL_33;
    }
    v72.receiver = self;
    v72.super_class = (Class)VCVoiceShortcut;
    id v27 = [(VCVoiceShortcut *)&v72 init];
    if (v27)
    {
      uint64_t v34 = [v29 copy];
      identifier = v27->_identifier;
      v27->_identifier = (NSString *)v34;

      uint64_t v36 = [v21 copy];
      phrase = v27->_phrase;
      v27->_phrase = (NSString *)v36;

      uint64_t v38 = [v70 copy];
      shortcutName = v27->_shortcutName;
      v27->_shortcutName = (NSString *)v38;

      v40 = v64;
      uint64_t v41 = [v64 copy];
      shortcutDescription = v27->_shortcutDescription;
      v27->_shortcutDescription = (NSString *)v41;

      uint64_t v43 = [v23 copy];
      associatedAppBundleIdentifier = v27->_associatedAppBundleIdentifier;
      v27->_associatedAppBundleIdentifier = (NSString *)v43;

      objc_storeStrong((id *)&v27->_dateCreated, obj);
      objc_storeStrong((id *)&v27->_dateLastModified, a9);
      objc_storeStrong((id *)&v27->_lastRunDate, a10);
      objc_storeStrong((id *)&v27->_runEventsCount, a11);
      uint64_t v45 = [v28 copy];
      shortcut = v27->_shortcut;
      v27->_shortcut = (INShortcut *)v45;

      v47 = v65;
      if ([v65 length])
      {
        uint64_t v48 = [MEMORY[0x1E4F304C0] imageWithImageData:v65];
        keyImage = v27->_keyImage;
        v27->_keyImage = (INImage *)v48;
      }
      else
      {
        keyImage = v27->_keyImage;
        v27->_keyImage = 0;
      }

      id v27 = v27;
      v50 = v27;
LABEL_33:
      v51 = v70;
      goto LABEL_34;
    }
    goto LABEL_23;
  }
  if (!a14)
  {
LABEL_23:
    v50 = 0;
    goto LABEL_24;
  }
  v50 = 0;
  *a14 = v32;
LABEL_24:
  v40 = v64;
  v51 = v70;
  v47 = v65;
LABEL_34:

  return v50;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end