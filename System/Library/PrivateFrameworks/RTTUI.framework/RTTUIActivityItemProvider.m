@interface RTTUIActivityItemProvider
- (NSAttributedString)transcript;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setTranscript:(id)a3;
@end

@implementation RTTUIActivityItemProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v4 = (void *)getLPLinkMetadataClass_softClass;
  uint64_t v13 = getLPLinkMetadataClass_softClass;
  if (!getLPLinkMetadataClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getLPLinkMetadataClass_block_invoke;
    v9[3] = &unk_2646386E0;
    v9[4] = &v10;
    __getLPLinkMetadataClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  v5 = v4;
  _Block_object_dispose(&v10, 8);
  id v6 = objc_alloc_init(v5);
  v7 = ttyLocString();
  [v6 setTitle:v7];

  return v6;
}

- (NSAttributedString)transcript
{
  return self->_transcript;
}

- (void)setTranscript:(id)a3
{
}

- (void).cxx_destruct
{
}

@end