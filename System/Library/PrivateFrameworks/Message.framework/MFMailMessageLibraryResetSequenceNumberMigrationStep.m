@interface MFMailMessageLibraryResetSequenceNumberMigrationStep
+ (int)runWithConnection:(id)a3;
@end

@implementation MFMailMessageLibraryResetSequenceNumberMigrationStep

+ (int)runWithConnection:(id)a3
{
  return [a3 executeStatementString:@"UPDATE messages SET sequence_identifier = 0" errorMessage:@"Reset sequence_identifier for messages"] ^ 1;
}

@end