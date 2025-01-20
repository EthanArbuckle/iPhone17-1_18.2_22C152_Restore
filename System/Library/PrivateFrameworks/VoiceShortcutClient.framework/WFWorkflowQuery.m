@interface WFWorkflowQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)includeTombstonesAndConflicts;
- (NSString)folderIdentifier;
- (NSString)workflowType;
- (WFWorkflowQuery)initWithCoder:(id)a3;
- (WFWorkflowQuery)initWithCollectionIdentifier:(id)a3;
- (WFWorkflowQuery)initWithFolderIdentifier:(id)a3;
- (WFWorkflowQuery)initWithLocation:(unint64_t)a3;
- (WFWorkflowQuery)initWithWorkflowType:(id)a3;
- (int64_t)resultsLimit;
- (unint64_t)location;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludeTombstonesAndConflicts:(BOOL)a3;
- (void)setResultsLimit:(int64_t)a3;
@end

@implementation WFWorkflowQuery

- (int64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (unint64_t)location
{
  return self->_location;
}

- (BOOL)includeTombstonesAndConflicts
{
  return self->_includeTombstonesAndConflicts;
}

- (NSString)folderIdentifier
{
  return self->_folderIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIdentifier, 0);
  objc_storeStrong((id *)&self->_workflowType, 0);
}

- (WFWorkflowQuery)initWithFolderIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(WFWorkflowQuery *)self initWithLocation:3];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    folderIdentifier = v5->_folderIdentifier;
    v5->_folderIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFWorkflowQuery)initWithLocation:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFWorkflowQuery;
  id v4 = [(WFWorkflowQuery *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_location = a3;
    uint64_t v6 = v4;
  }

  return v5;
}

- (void)setIncludeTombstonesAndConflicts:(BOOL)a3
{
  self->_includeTombstonesAndConflicts = a3;
}

- (void)setResultsLimit:(int64_t)a3
{
  self->_resultsLimit = a3;
}

- (NSString)workflowType
{
  return self->_workflowType;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[WFWorkflowQuery location](self, "location"), @"location");
  id v4 = [(WFWorkflowQuery *)self folderIdentifier];
  [v6 encodeObject:v4 forKey:@"folderIdentifier"];

  v5 = [(WFWorkflowQuery *)self workflowType];
  [v6 encodeObject:v5 forKey:@"workflowType"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[WFWorkflowQuery resultsLimit](self, "resultsLimit"), @"resultsLimit");
  objc_msgSend(v6, "encodeBool:forKey:", -[WFWorkflowQuery includeTombstonesAndConflicts](self, "includeTombstonesAndConflicts"), @"includeTombstonesAndConflicts");
}

- (WFWorkflowQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWorkflowQuery;
  v5 = [(WFWorkflowQuery *)&v12 init];
  if (v5)
  {
    v5->_location = [v4 decodeIntegerForKey:@"location"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"folderIdentifier"];
    folderIdentifier = v5->_folderIdentifier;
    v5->_folderIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflowType"];
    workflowType = v5->_workflowType;
    v5->_workflowType = (NSString *)v8;

    v5->_resultsLimit = [v4 decodeIntegerForKey:@"resultsLimit"];
    v5->_includeTombstonesAndConflicts = [v4 decodeBoolForKey:@"includeTombstonesAndConflicts"];
    v10 = v5;
  }

  return v5;
}

- (WFWorkflowQuery)initWithCollectionIdentifier:(id)a3
{
  if (a3) {
    v3 = -[WFWorkflowQuery initWithFolderIdentifier:](self, "initWithFolderIdentifier:");
  }
  else {
    v3 = [(WFWorkflowQuery *)self initWithLocation:1];
  }
  id v4 = v3;

  return v4;
}

- (WFWorkflowQuery)initWithWorkflowType:(id)a3
{
  id v4 = a3;
  v5 = [(WFWorkflowQuery *)self initWithLocation:2];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    workflowType = v5->_workflowType;
    v5->_workflowType = (NSString *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end