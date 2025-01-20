@interface WFCloudKitBaseOrdering
+ (NSDictionary)properties;
+ (NSString)recordBasename;
+ (NSString)recordType;
+ (id)collectionIdentifierForRecordID:(id)a3;
- (CKRecordID)identifier;
- (NSArray)orderedFolderIDsArray;
- (NSArray)orderedWorkflowIDsArray;
- (NSData)recordSystemFieldsData;
- (NSOrderedSet)orderedFolderIDs;
- (NSOrderedSet)orderedWorkflowIDs;
- (NSString)collectionIdentifier;
- (WFCloudKitBaseOrdering)initWithIdentifier:(id)a3 orderedWorkflowIDs:(id)a4 orderedFolderIDs:(id)a5;
- (void)setRecordSystemFieldsData:(id)a3;
@end

@implementation WFCloudKitBaseOrdering

+ (id)collectionIdentifierForRecordID:(id)a3
{
  v4 = [a3 recordName];
  v5 = NSString;
  v6 = [a1 recordBasename];
  v7 = [v5 stringWithFormat:@"%@-", v6];

  if ([v4 hasPrefix:v7])
  {
    v8 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v7, "length"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (NSString)recordBasename
{
  return (NSString *)&stru_1F229A4D8;
}

+ (NSDictionary)properties
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"orderedWorkflowIDs";
  v2 = +[WFCloudKitItemProperty objectPropertyWithName:@"orderedWorkflowIDsArray"];
  v6[1] = @"orderedFolderIDs";
  v7[0] = v2;
  v3 = +[WFCloudKitItemProperty objectPropertyWithName:@"orderedFolderIDsArray"];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return (NSDictionary *)v4;
}

+ (NSString)recordType
{
  return (NSString *)&stru_1F229A4D8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedFolderIDsArray, 0);
  objc_storeStrong((id *)&self->_orderedWorkflowIDsArray, 0);
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)orderedFolderIDsArray
{
  return self->_orderedFolderIDsArray;
}

- (NSArray)orderedWorkflowIDsArray
{
  return self->_orderedWorkflowIDsArray;
}

- (void)setRecordSystemFieldsData:(id)a3
{
}

- (NSData)recordSystemFieldsData
{
  return self->_recordSystemFieldsData;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (WFCloudKitBaseOrdering)initWithIdentifier:(id)a3 orderedWorkflowIDs:(id)a4 orderedFolderIDs:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFCloudKitBaseOrdering.m", 70, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v13 = [(WFCloudKitBaseOrdering *)self init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    uint64_t v15 = [v11 array];
    orderedWorkflowIDsArray = v14->_orderedWorkflowIDsArray;
    v14->_orderedWorkflowIDsArray = (NSArray *)v15;

    uint64_t v17 = [v12 array];
    orderedFolderIDsArray = v14->_orderedFolderIDsArray;
    v14->_orderedFolderIDsArray = (NSArray *)v17;

    v19 = v14;
  }

  return v14;
}

- (NSOrderedSet)orderedWorkflowIDs
{
  v3 = [(WFCloudKitBaseOrdering *)self orderedWorkflowIDsArray];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1CAA0];
    v5 = [(WFCloudKitBaseOrdering *)self orderedWorkflowIDsArray];
    v6 = [v4 orderedSetWithArray:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSOrderedSet *)v6;
}

- (NSOrderedSet)orderedFolderIDs
{
  v3 = [(WFCloudKitBaseOrdering *)self orderedFolderIDsArray];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1CAA0];
    v5 = [(WFCloudKitBaseOrdering *)self orderedFolderIDsArray];
    v6 = [v4 orderedSetWithArray:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSOrderedSet *)v6;
}

- (NSString)collectionIdentifier
{
  v3 = objc_opt_class();
  v4 = [(WFCloudKitBaseOrdering *)self identifier];
  v5 = [v3 collectionIdentifierForRecordID:v4];

  return (NSString *)v5;
}

@end