@interface SBSystemShellExtendedDisplayResolverFactory
- (id)resolverForPhysicalDisplay:(id)a3;
- (int64_t)displayWindowingMode;
@end

@implementation SBSystemShellExtendedDisplayResolverFactory

- (int64_t)displayWindowingMode
{
  return 1;
}

- (id)resolverForPhysicalDisplay:(id)a3
{
  id v5 = a3;
  v6 = [v5 identity];
  if (([v6 isRootIdentity] & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBSystemShellExtendedDisplayResolverFactory.m", 33, @"Invalid parameter not satisfying: %@", @"[rootDisplayIdentity isRootIdentity]" object file lineNumber description];
  }
  if (objc_msgSend(v6, "_sb_supportsExtendedDisplayMode"))
  {
    v7 = +[SBDefaults localDefaults];
    v8 = [v7 externalDisplayDefaults];

    v9 = objc_msgSend(MEMORY[0x1E4FA5E58], "withDisplay:useNativeSize:", v5, objc_msgSend(v8, "chamois"));
    uint64_t v10 = [v9 supportedScales];

    if (v10) {
      v11 = [[SBSystemShellExtendedDisplayResolver alloc] initWithRootDisplay:v6];
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end