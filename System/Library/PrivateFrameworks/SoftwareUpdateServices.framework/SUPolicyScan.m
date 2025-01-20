@interface SUPolicyScan
- (BOOL)allowSameVersion;
- (BOOL)restrictToFull;
- (BOOL)restrictToIncremental;
- (NSString)assetType;
- (NSString)scanType;
- (NSString)sessionID;
- (SUPolicyScan)init;
- (SUPolicyScan)initWithScanOptions:(id)a3;
- (SUScanOptions)scanOptions;
- (id)_stringForBool:(BOOL)a3;
- (id)description;
- (int)downloadTimeoutSecs;
- (void)setScanOptions:(id)a3;
@end

@implementation SUPolicyScan

- (SUPolicyScan)init
{
  return [(SUPolicyScan *)self initWithScanOptions:0];
}

- (SUPolicyScan)initWithScanOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUPolicyScan;
  v5 = [(SUPolicyScan *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SUPolicyScan *)v5 setScanOptions:v4];
  }

  return v6;
}

- (NSString)assetType
{
  return 0;
}

- (NSString)scanType
{
  v2 = [(SUPolicyScan *)self scanOptions];
  int v3 = [v2 isForced];
  id v4 = &kSUScanTypeForeground;
  if (!v3) {
    id v4 = &kSUScanTypeBackground;
  }
  v5 = *v4;

  return v5;
}

- (BOOL)restrictToIncremental
{
  return 0;
}

- (BOOL)restrictToFull
{
  v2 = +[SUPreferences sharedInstance];
  char v3 = [v2 forceFullReplacement];

  return v3;
}

- (BOOL)allowSameVersion
{
  v2 = +[SUPreferences sharedInstance];
  char v3 = [v2 allowSameBuildUpdates];

  return v3;
}

- (int)downloadTimeoutSecs
{
  if (+[SUUtility currentReleaseTypeIsInternal]) {
    return 60;
  }
  else {
    return 30;
  }
}

- (NSString)sessionID
{
  v2 = [(SUPolicyScan *)self scanOptions];
  char v3 = [v2 sessionID];

  return (NSString *)v3;
}

- (id)_stringForBool:(BOOL)a3
{
  if (a3) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

- (id)description
{
  char v3 = NSString;
  id v4 = [(SUPolicyScan *)self assetType];
  v5 = [(SUPolicyScan *)self _stringForBool:[(SUPolicy *)self discretionary]];
  v6 = [(SUPolicyScan *)self _stringForBool:[(SUPolicy *)self allowsCellular]];
  v7 = [(SUPolicyScan *)self _stringForBool:[(SUPolicy *)self requiresPowerPluggedIn]];
  objc_super v8 = [(SUPolicyScan *)self _stringForBool:[(SUPolicyScan *)self restrictToIncremental]];
  v9 = [(SUPolicyScan *)self _stringForBool:[(SUPolicyScan *)self restrictToFull]];
  v10 = [(SUPolicyScan *)self _stringForBool:[(SUPolicyScan *)self allowSameVersion]];
  v11 = [(SUPolicyScan *)self sessionID];
  v12 = [v3 stringWithFormat:@"\n            assetType:%@\n            discretionary: %@\n            allowsCellular: %@\n            requiresPowerPluggedIn: %@\n            restrictToIncremental: %@\n            restrictToFull: %@\n            allowSameVersion: %@\n            sessionID: %@\n            downloadTimeoutSecs: %d\n", v4, v5, v6, v7, v8, v9, v10, v11, -[SUPolicyScan downloadTimeoutSecs](self, "downloadTimeoutSecs")];

  return v12;
}

- (SUScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end