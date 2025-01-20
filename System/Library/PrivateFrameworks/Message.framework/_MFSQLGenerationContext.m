@interface _MFSQLGenerationContext
@end

@implementation _MFSQLGenerationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->propertyMapper, 0);
  objc_storeStrong((id *)&self->mailboxIDs, 0);
  objc_storeStrong((id *)&self->searchableIndexManager, 0);
}

@end