@interface PFAIGlossaryState
- (Class)drawablePlacementClass;
- (PFAIGlossaryState)initWithEntryBody:(id)a3 documentRoot:(id)a4 archive:(id)a5 documentEntryUri:(id)a6;
- (THModelGlossaryEntryBody)entryBody;
- (id)currentHtmlDocMediaState;
- (void)dealloc;
@end

@implementation PFAIGlossaryState

- (PFAIGlossaryState)initWithEntryBody:(id)a3 documentRoot:(id)a4 archive:(id)a5 documentEntryUri:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PFAIGlossaryState;
  v7 = [(PFXHtmlReaderState *)&v11 initWithDocumentRoot:a4 contentNode:0 entry:a6 inArchive:a5];
  if (v7)
  {
    v8 = [PFXHtmlDocMediaState alloc];
    id v9 = [a3 bodyStorage];
    v7->mDocMediaState = [(PFXHtmlDocMediaState *)v8 initWithStorage:v9 readerState:v7 defaultParagraphStyleIdentifier:kTSWPDefaultGlossaryParagraphStyleIdentifier];
    v7->mEntryBody = (THModelGlossaryEntryBody *)a3;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIGlossaryState;
  [(PFXHtmlReaderState *)&v3 dealloc];
}

- (id)currentHtmlDocMediaState
{
  return self->mDocMediaState;
}

- (THModelGlossaryEntryBody)entryBody
{
  return self->mEntryBody;
}

- (Class)drawablePlacementClass
{
  return (Class)objc_opt_class();
}

@end