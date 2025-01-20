@interface MIAppIdentity
- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3;
@end

@implementation MIAppIdentity

- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3
{
  v4 = [(MIAppIdentity *)self bundleID];
  if (+[ICLFeatureFlags appReferencesEnabled])
  {
    v6 = +[MIAppReferenceManager defaultManager];
    id v13 = 0;
    v7 = [v6 personaUniqueStringsForAppWithBundleID:v4 error:&v13];
    id v8 = v13;

    if (v7)
    {
      if ([v7 count] == (id)1)
      {
        v10 = [v7 anyObject];
        if (!a3) {
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v11 = sub_100014A08((uint64_t)"-[MIAppIdentity(MIDaemonUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]", 44, MIInstallerErrorDomain, 192, 0, 0, @"Can't resolve the persona associated with the bundle %@ from the associated personas in app references: %@", v9, (uint64_t)v4);

        v10 = 0;
        id v8 = (id)v11;
        if (!a3) {
          goto LABEL_13;
        }
      }
    }
    else
    {
      v10 = 0;
      if (!a3) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    sub_1000149C8((uint64_t)"-[MIAppIdentity(MIDaemonUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]", 32, MIInstallerErrorDomain, 161, 0, 0, @"%s is not enabled", v5, (uint64_t)"-[MIAppIdentity(MIDaemonUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v7 = 0;
    if (!a3) {
      goto LABEL_13;
    }
  }
  if (!v10) {
    *a3 = v8;
  }
LABEL_13:

  return v10;
}

@end