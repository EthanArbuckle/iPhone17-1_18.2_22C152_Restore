@interface _RDDefaultPostDataSeparationAttachmentFileManagerDocumentsURLProvider
- (id)documentsURLForAccountIdentifier:(id)a3;
@end

@implementation _RDDefaultPostDataSeparationAttachmentFileManagerDocumentsURLProvider

- (id)documentsURLForAccountIdentifier:(id)a3
{
  return +[RDPaths defaultReminderDataContainerURL];
}

@end