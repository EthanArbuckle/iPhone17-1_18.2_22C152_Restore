@interface MAAutoAssetSetInfoInstance
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetSetInfoInstance)initWithCoder:(id)a3;
- (NSArray)autoAssetEntries;
- (NSArray)entriesWhenTargeting;
- (NSString)assetSetIdentifier;
- (NSString)atomicInstance;
- (NSString)autoAssetSetClientName;
- (NSString)clientDomainName;
- (NSString)clientProcessName;
- (NSUUID)frameworkInstanceUUID;
- (id)description;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 withProcessName:(id)a5 withProcessID:(int64_t)a6 forAssetSetIdentifier:(id)a7 forAtomicInstance:(id)a8 comprisedOfEntries:(id)a9 asEntriesWhenTargeting:(id)a10 associatingFrameworkUUID:(id)a11;
- (id)summary;
- (int64_t)clientProcessID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetSetInfoInstance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkInstanceUUID, 0);
  objc_storeStrong((id *)&self->_entriesWhenTargeting, 0);
  objc_storeStrong((id *)&self->_autoAssetEntries, 0);
  objc_storeStrong((id *)&self->_atomicInstance, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_autoAssetSetClientName, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MAAutoAssetSetInfoInstance)initWithCoder:(id)a3
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MAAutoAssetSetInfoInstance;
  v5 = [(MAAutoAssetSetInfoInstance *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDomainName"];
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoAssetSetClientName"];
    autoAssetSetClientName = v5->_autoAssetSetClientName;
    v5->_autoAssetSetClientName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientProcessName"];
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v10;

    v5->_clientProcessID = [v4 decodeIntegerForKey:@"clientProcessID"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"atomicInstance"];
    atomicInstance = v5->_atomicInstance;
    v5->_atomicInstance = (NSString *)v14;

    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
    v18 = (void *)[v16 initWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"autoAssetEntries"];
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v19;

    id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v30[3] = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    v23 = (void *)[v21 initWithArray:v22];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"entriesWhenTargeting"];
    entriesWhenTargeting = v5->_entriesWhenTargeting;
    v5->_entriesWhenTargeting = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frameworkInstanceUUID"];
    frameworkInstanceUUID = v5->_frameworkInstanceUUID;
    v5->_frameworkInstanceUUID = (NSUUID *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAssetSetInfoInstance *)self clientDomainName];
  [v4 encodeObject:v5 forKey:@"clientDomainName"];

  uint64_t v6 = [(MAAutoAssetSetInfoInstance *)self autoAssetSetClientName];
  [v4 encodeObject:v6 forKey:@"autoAssetSetClientName"];

  v7 = [(MAAutoAssetSetInfoInstance *)self clientProcessName];
  [v4 encodeObject:v7 forKey:@"clientProcessName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetInfoInstance clientProcessID](self, "clientProcessID"), @"clientProcessID");
  uint64_t v8 = [(MAAutoAssetSetInfoInstance *)self assetSetIdentifier];
  [v4 encodeObject:v8 forKey:@"assetSetIdentifier"];

  v9 = [(MAAutoAssetSetInfoInstance *)self atomicInstance];
  [v4 encodeObject:v9 forKey:@"atomicInstance"];

  uint64_t v10 = [(MAAutoAssetSetInfoInstance *)self autoAssetEntries];
  [v4 encodeObject:v10 forKey:@"autoAssetEntries"];

  v11 = [(MAAutoAssetSetInfoInstance *)self entriesWhenTargeting];
  [v4 encodeObject:v11 forKey:@"entriesWhenTargeting"];

  id v12 = [(MAAutoAssetSetInfoInstance *)self frameworkInstanceUUID];
  [v4 encodeObject:v12 forKey:@"frameworkInstanceUUID"];
}

- (id)summary
{
  v20 = NSString;
  uint64_t v21 = [(MAAutoAssetSetInfoInstance *)self clientDomainName];
  v23 = [(MAAutoAssetSetInfoInstance *)self autoAssetSetClientName];
  v22 = [(MAAutoAssetSetInfoInstance *)self clientProcessName];
  int64_t v3 = [(MAAutoAssetSetInfoInstance *)self clientProcessID];
  id v4 = [(MAAutoAssetSetInfoInstance *)self assetSetIdentifier];
  v5 = [(MAAutoAssetSetInfoInstance *)self atomicInstance];
  if (v5)
  {
    uint64_t v6 = [(MAAutoAssetSetInfoInstance *)self atomicInstance];
  }
  else
  {
    uint64_t v6 = @"N";
  }
  v7 = [(MAAutoAssetSetInfoInstance *)self autoAssetEntries];
  if (v7)
  {
    id v8 = [NSString alloc];
    uint64_t v19 = [(MAAutoAssetSetInfoInstance *)self autoAssetEntries];
    v9 = (__CFString *)objc_msgSend(v8, "initWithFormat:", @"%ld", objc_msgSend(v19, "count"));
  }
  else
  {
    v9 = @"N";
  }
  uint64_t v10 = [(MAAutoAssetSetInfoInstance *)self entriesWhenTargeting];
  if (v10)
  {
    id v11 = [NSString alloc];
    id v12 = [(MAAutoAssetSetInfoInstance *)self entriesWhenTargeting];
    v13 = objc_msgSend(v11, "initWithFormat:", @"%ld", objc_msgSend(v12, "count"));
    int64_t v17 = v3;
    uint64_t v14 = (void *)v21;
    v15 = [v20 stringWithFormat:@"domainName:%@|clientName:%@|processName:%@|pid:%ld|setIdentifier:%@|atomicInstance:%@|entries:%@(WhenTargeting:%@)", v21, v23, v22, v17, v4, v6, v9, v13];
  }
  else
  {
    int64_t v18 = v3;
    uint64_t v14 = (void *)v21;
    v15 = [v20 stringWithFormat:@"domainName:%@|clientName:%@|processName:%@|pid:%ld|setIdentifier:%@|atomicInstance:%@|entries:%@(WhenTargeting:%@)", v21, v23, v22, v18, v4, v6, v9, @"N"];
  }

  if (v7)
  {
  }
  if (v5) {

  }
  return v15;
}

- (NSArray)entriesWhenTargeting
{
  return self->_entriesWhenTargeting;
}

- (NSArray)autoAssetEntries
{
  return self->_autoAssetEntries;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (int64_t)clientProcessID
{
  return self->_clientProcessID;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)autoAssetSetClientName
{
  return self->_autoAssetSetClientName;
}

- (NSString)atomicInstance
{
  return self->_atomicInstance;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (id)description
{
  int64_t v3 = [(MAAutoAssetSetInfoInstance *)self autoAssetEntries];

  id v4 = [(MAAutoAssetSetInfoInstance *)self entriesWhenTargeting];

  v5 = NSString;
  uint64_t v6 = [(MAAutoAssetSetInfoInstance *)self summary];
  uint64_t v7 = [(MAAutoAssetSetInfoInstance *)self frameworkInstanceUUID];
  id v8 = (void *)v7;
  if (v3)
  {
    v9 = [(MAAutoAssetSetInfoInstance *)self autoAssetEntries];
    uint64_t v10 = [v9 description];
    id v11 = (void *)v10;
    if (v4)
    {
      id v12 = [(MAAutoAssetSetInfoInstance *)self entriesWhenTargeting];
      v13 = [v12 description];
      uint64_t v14 = [v5 stringWithFormat:@"%@|%@\nautoAssetEntries:\n%@\nentriesWhenTargeting:\n%@", v6, v8, v11, v13];
    }
    else
    {
      uint64_t v14 = [v5 stringWithFormat:@"%@|%@\nautoAssetEntries:\n%@", v6, v8, v10];
    }

    goto LABEL_8;
  }
  if (v4)
  {
    v9 = [(MAAutoAssetSetInfoInstance *)self entriesWhenTargeting];
    v15 = [v9 description];
    uint64_t v14 = [v5 stringWithFormat:@"%@|%@\nentriesWhenTargeting:\n%@", v6, v8, v15];

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v14 = [v5 stringWithFormat:@"%@|%@", v6, v7];
LABEL_9:

  return v14;
}

- (NSUUID)frameworkInstanceUUID
{
  return self->_frameworkInstanceUUID;
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 withProcessName:(id)a5 withProcessID:(int64_t)a6 forAssetSetIdentifier:(id)a7 forAtomicInstance:(id)a8 comprisedOfEntries:(id)a9 asEntriesWhenTargeting:(id)a10 associatingFrameworkUUID:(id)a11
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v17 = a11;
  v29.receiver = self;
  v29.super_class = (Class)MAAutoAssetSetInfoInstance;
  int64_t v18 = [(MAAutoAssetSetInfoInstance *)&v29 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientDomainName, a3);
    objc_storeStrong((id *)&v19->_autoAssetSetClientName, a4);
    objc_storeStrong((id *)&v19->_clientProcessName, a5);
    v19->_clientProcessID = a6;
    objc_storeStrong((id *)&v19->_assetSetIdentifier, a7);
    objc_storeStrong((id *)&v19->_atomicInstance, a8);
    objc_storeStrong((id *)&v19->_autoAssetEntries, a9);
    objc_storeStrong((id *)&v19->_entriesWhenTargeting, a10);
    objc_storeStrong((id *)&v19->_frameworkInstanceUUID, a11);
  }

  return v19;
}

@end