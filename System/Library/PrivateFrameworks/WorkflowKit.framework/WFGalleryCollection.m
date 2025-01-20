@interface WFGalleryCollection
+ (NSDictionary)properties;
+ (NSString)recordType;
- (BOOL)isEqual:(id)a3;
- (CKRecordID)base;
- (CKRecordID)identifier;
- (NSArray)supportedIdioms;
- (NSArray)workflows;
- (NSDate)modifiedAt;
- (NSString)collectionDescription;
- (NSString)language;
- (NSString)name;
- (NSString)persistentIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)minVersion;
- (unint64_t)referenceActionForKey:(id)a3;
- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5;
- (void)setSupportedIdioms:(id)a3;
@end

@implementation WFGalleryCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_modifiedAt, 0);
  objc_storeStrong((id *)&self->_supportedIdioms, 0);
  objc_storeStrong((id *)&self->_workflows, 0);
  objc_storeStrong((id *)&self->_collectionDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (CKRecordID)base
{
  return self->_base;
}

- (NSString)language
{
  return self->_language;
}

- (NSDate)modifiedAt
{
  return self->_modifiedAt;
}

- (void)setSupportedIdioms:(id)a3
{
}

- (NSArray)supportedIdioms
{
  return self->_supportedIdioms;
}

- (int64_t)minVersion
{
  return self->_minVersion;
}

- (NSArray)workflows
{
  return self->_workflows;
}

- (NSString)collectionDescription
{
  return self->_collectionDescription;
}

- (NSString)name
{
  return self->_name;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [+[WFMutableGalleryCollection allocWithZone:](WFMutableGalleryCollection, "allocWithZone:") init];
  v6 = [(WFGalleryCollection *)self identifier];
  v7 = (void *)[v6 copyWithZone:a3];
  [(WFMutableGalleryCollection *)v5 setIdentifier:v7];

  v8 = [(WFGalleryCollection *)self name];
  v9 = (void *)[v8 copyWithZone:a3];
  [(WFMutableGalleryCollection *)v5 setName:v9];

  v10 = [(WFGalleryCollection *)self collectionDescription];
  v11 = (void *)[v10 copyWithZone:a3];
  [(WFMutableGalleryCollection *)v5 setCollectionDescription:v11];

  v12 = [(WFGalleryCollection *)self modifiedAt];
  v13 = (void *)[v12 copyWithZone:a3];
  [(WFMutableGalleryCollection *)v5 setModifiedAt:v13];

  v14 = [(WFGalleryCollection *)self workflows];
  v15 = (void *)[v14 copyWithZone:a3];
  [(WFMutableGalleryCollection *)v5 setWorkflows:v15];

  [(WFMutableGalleryCollection *)v5 setMinVersion:[(WFGalleryCollection *)self minVersion]];
  v16 = [(WFGalleryCollection *)self language];
  v17 = (void *)[v16 copyWithZone:a3];
  [(WFMutableGalleryCollection *)v5 setLanguage:v17];

  v18 = [(WFGalleryCollection *)self base];
  v19 = (void *)[v18 copyWithZone:a3];
  [(WFMutableGalleryCollection *)v5 setBase:v19];

  v20 = [(WFGalleryCollection *)self persistentIdentifier];
  v21 = (void *)[v20 copyWithZone:a3];
  [(WFMutableGalleryCollection *)v5 setPersistentIdentifier:v21];

  v22 = [(WFGalleryCollection *)self supportedIdioms];
  v23 = (void *)[v22 copyWithZone:a3];
  [(WFMutableGalleryCollection *)v5 setSupportedIdioms:v23];

  return v5;
}

+ (NSDictionary)properties
{
  v13[8] = *MEMORY[0x1E4F143B8];
  v12[0] = @"name";
  v2 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v13[0] = v2;
  v12[1] = @"description";
  v3 = +[WFCloudKitItemProperty objectPropertyWithName:@"collectionDescription"];
  v13[1] = v3;
  v12[2] = @"shortcuts";
  v4 = +[WFCloudKitItemProperty itemPropertyWithName:@"workflows" itemClass:objc_opt_class()];
  v13[2] = v4;
  v12[3] = @"minVersion";
  v5 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v13[3] = v5;
  v12[4] = @"language";
  v6 = +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v13[4] = v6;
  v12[5] = @"base";
  v7 = +[WFCloudKitItemProperty itemReferencePropertyWithName:@"base" itemClass:objc_opt_class()];
  v13[5] = v7;
  v12[6] = @"persistentIdentifier";
  v8 = +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v13[6] = v8;
  v12[7] = @"supportedIdioms";
  v9 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v13[7] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:8];

  return (NSDictionary *)v10;
}

+ (NSString)recordType
{
  return (NSString *)@"GalleryCollection";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[WFGalleryCollection allocWithZone:](WFGalleryCollection, "allocWithZone:") init];
  v6 = [(WFGalleryCollection *)self identifier];
  uint64_t v7 = [v6 copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (CKRecordID *)v7;

  v9 = [(WFGalleryCollection *)self name];
  uint64_t v10 = [v9 copyWithZone:a3];
  name = v5->_name;
  v5->_name = (NSString *)v10;

  v12 = [(WFGalleryCollection *)self collectionDescription];
  uint64_t v13 = [v12 copyWithZone:a3];
  collectionDescription = v5->_collectionDescription;
  v5->_collectionDescription = (NSString *)v13;

  v15 = [(WFGalleryCollection *)self workflows];
  uint64_t v16 = [v15 copyWithZone:a3];
  workflows = v5->_workflows;
  v5->_workflows = (NSArray *)v16;

  v18 = [(WFGalleryCollection *)self modifiedAt];
  uint64_t v19 = [v18 copyWithZone:a3];
  modifiedAt = v5->_modifiedAt;
  v5->_modifiedAt = (NSDate *)v19;

  v5->_minVersion = [(WFGalleryCollection *)self minVersion];
  v21 = [(WFGalleryCollection *)self language];
  uint64_t v22 = [v21 copyWithZone:a3];
  language = v5->_language;
  v5->_language = (NSString *)v22;

  v24 = [(WFGalleryCollection *)self base];
  uint64_t v25 = [v24 copyWithZone:a3];
  base = v5->_base;
  v5->_base = (CKRecordID *)v25;

  v27 = [(WFGalleryCollection *)self persistentIdentifier];
  uint64_t v28 = [v27 copyWithZone:a3];
  persistentIdentifier = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v28;

  v30 = [(WFGalleryCollection *)self supportedIdioms];
  uint64_t v31 = [v30 copyWithZone:a3];
  supportedIdioms = v5->_supportedIdioms;
  v5->_supportedIdioms = (NSArray *)v31;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFGalleryCollection *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(WFGalleryCollection *)self identifier];
      uint64_t v7 = [(WFGalleryCollection *)v5 identifier];
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        id v13 = v8;
        if (!v8 || !v9) {
          goto LABEL_78;
        }
        int v14 = [v8 isEqual:v9];

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_79:

          goto LABEL_80;
        }
      }
      v15 = [(WFGalleryCollection *)self name];
      uint64_t v16 = [(WFGalleryCollection *)v5 name];
      id v13 = v15;
      id v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        id v19 = v13;
        if (!v13 || !v17) {
          goto LABEL_77;
        }
        int v20 = [v13 isEqualToString:v17];

        if (!v20)
        {
          LOBYTE(v11) = 0;
LABEL_78:

          goto LABEL_79;
        }
      }
      v21 = [(WFGalleryCollection *)self collectionDescription];
      uint64_t v22 = [(WFGalleryCollection *)v5 collectionDescription];
      id v19 = v21;
      id v23 = v22;
      v18 = v23;
      id v81 = v19;
      if (v19 == v23)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v24 = v23;
        if (!v19 || !v23) {
          goto LABEL_76;
        }
        int v11 = [v19 isEqualToString:v23];

        if (!v11) {
          goto LABEL_77;
        }
      }
      v80 = v18;
      uint64_t v25 = [(WFGalleryCollection *)self workflows];
      v26 = [(WFGalleryCollection *)v5 workflows];
      id v27 = v25;
      id v28 = v26;
      v78 = v28;
      id v79 = v27;
      if (v27 == v28)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        if (!v27)
        {
          v29 = v28;
          v18 = v80;
          goto LABEL_74;
        }
        v29 = v28;
        v18 = v80;
        if (!v28)
        {
LABEL_74:

          goto LABEL_75;
        }
        int v30 = [v27 isEqualToArray:v28];

        if (!v30)
        {
          LOBYTE(v11) = 0;
          v18 = v80;
LABEL_75:
          v24 = v78;
          id v19 = v79;
LABEL_76:

          id v19 = v81;
LABEL_77:

          goto LABEL_78;
        }
      }
      uint64_t v31 = [(WFGalleryCollection *)self modifiedAt];
      v32 = [(WFGalleryCollection *)v5 modifiedAt];
      id v27 = v31;
      id v33 = v32;
      id v34 = v33;
      if (v27 != v33)
      {
        LOBYTE(v11) = 0;
        id v77 = v27;
        v35 = v33;
        if (v27)
        {
          v18 = v80;
          if (v33)
          {
            v36 = v33;
            int v37 = [v27 isEqual:v33];
            id v76 = v36;

            if (!v37) {
              goto LABEL_41;
            }
LABEL_35:
            int64_t v38 = [(WFGalleryCollection *)self minVersion];
            if (v38 != [(WFGalleryCollection *)v5 minVersion])
            {
LABEL_41:
              LOBYTE(v11) = 0;
              v18 = v80;
              v29 = v76;
              goto LABEL_74;
            }
            v39 = [(WFGalleryCollection *)self language];
            v40 = [(WFGalleryCollection *)v5 language];
            id v41 = v39;
            id v42 = v40;
            v74 = v42;
            v75 = v41;
            id v77 = v27;
            if (v41 != v42)
            {
              LOBYTE(v11) = 0;
              if (v41)
              {
                v43 = v42;
                v44 = v41;
                v18 = v80;
                if (v42)
                {
                  int v45 = [v75 isEqualToString:v42];

                  if (!v45)
                  {
                    LOBYTE(v11) = 0;
                    v18 = v80;
LABEL_72:
                    id v27 = v75;
                    id v34 = v76;
                    v35 = v74;
                    goto LABEL_73;
                  }
LABEL_45:
                  v46 = [(WFGalleryCollection *)self base];
                  v47 = [(WFGalleryCollection *)v5 base];
                  id v48 = v46;
                  id v49 = v47;
                  v72 = v49;
                  v73 = v48;
                  if (v48 != v49)
                  {
                    LOBYTE(v11) = 0;
                    if (v48)
                    {
                      v50 = v49;
                      id v51 = v48;
                      v18 = v80;
                      if (v49)
                      {
                        int v70 = [v73 isEqual:v49];

                        if (!v70)
                        {
                          LOBYTE(v11) = 0;
                          v18 = v80;
LABEL_70:
                          v43 = v72;
                          v44 = v73;
                          goto LABEL_71;
                        }
LABEL_51:
                        v52 = [(WFGalleryCollection *)self persistentIdentifier];
                        v53 = [(WFGalleryCollection *)v5 persistentIdentifier];
                        id v54 = v52;
                        id v55 = v53;
                        v69 = v55;
                        v71 = v54;
                        if (v54 == v55)
                        {
                        }
                        else
                        {
                          LOBYTE(v11) = 0;
                          if (!v54)
                          {
                            v56 = v55;
                            id v57 = 0;
                            v18 = v80;
                            goto LABEL_67;
                          }
                          v56 = v55;
                          id v57 = v54;
                          v18 = v80;
                          if (!v55)
                          {
LABEL_67:
                            v63 = v57;

                            goto LABEL_68;
                          }
                          int v67 = [v71 isEqualToString:v55];

                          if (!v67)
                          {
                            LOBYTE(v11) = 0;
                            v18 = v80;
LABEL_68:
                            v50 = v69;
                            id v51 = v71;
                            goto LABEL_69;
                          }
                        }
                        v58 = [(WFGalleryCollection *)self supportedIdioms];
                        v59 = [(WFGalleryCollection *)v5 supportedIdioms];
                        id v60 = v58;
                        id v61 = v59;
                        v62 = v60;
                        v68 = v61;
                        if (v60 == v61)
                        {
                          LOBYTE(v11) = 1;
                        }
                        else
                        {
                          LOBYTE(v11) = 0;
                          if (v60)
                          {
                            v18 = v80;
                            if (v61) {
                              LOBYTE(v11) = [v62 isEqualToArray:v61];
                            }
                            goto LABEL_65;
                          }
                        }
                        v18 = v80;
LABEL_65:

                        v56 = v68;
                        id v57 = v62;
                        goto LABEL_67;
                      }
                    }
                    else
                    {
                      v50 = v49;
                      id v51 = 0;
                      v18 = v80;
                    }
LABEL_69:
                    v64 = v51;

                    goto LABEL_70;
                  }

                  goto LABEL_51;
                }
              }
              else
              {
                v43 = v42;
                v44 = 0;
                v18 = v80;
              }
LABEL_71:

              goto LABEL_72;
            }

            goto LABEL_45;
          }
        }
        else
        {
          v18 = v80;
        }
LABEL_73:
        v65 = v34;

        v29 = v65;
        id v27 = v77;
        goto LABEL_74;
      }
      id v76 = v33;

      goto LABEL_35;
    }
    LOBYTE(v11) = 0;
  }
LABEL_80:

  return v11;
}

- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5
{
}

- (unint64_t)referenceActionForKey:(id)a3
{
  return [a3 isEqualToString:@"base"];
}

@end