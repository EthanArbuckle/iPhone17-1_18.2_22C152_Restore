@interface ICAttachmentMapModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
- (BOOL)canConvertToHTMLForSharing;
- (BOOL)hasPreviews;
- (BOOL)preferLocalPreviewImages;
- (BOOL)previewsSupportMultipleAppearances;
- (BOOL)shouldSyncPreviewImageToCloud:(id)a3;
- (id)MKMapItem;
- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4;
- (void)MKMapItem;
- (void)addLocation;
@end

@implementation ICAttachmentMapModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  v4 = NSString;
  v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_MAP_LOCATIONS_%lu" value:@"NOTE_LIST_MAP_LOCATIONS_%lu" table:0 allowSiri:1];
  v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (BOOL)previewsSupportMultipleAppearances
{
  return 1;
}

- (BOOL)preferLocalPreviewImages
{
  return 1;
}

- (BOOL)hasPreviews
{
  return 1;
}

- (id)MKMapItem
{
  v2 = [(ICAttachmentModel *)self attachment];
  v3 = [v2 metadata];
  v4 = [v3 objectForKeyedSubscript:@"map_item_data"];

  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
    id v13 = 0;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v13];
    id v7 = v13;
    if (v7)
    {
      v8 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ICAttachment(ICAttachmentPersistenceAdditions) loadFromArchive:dataPersister:withIdentifierMap:]((uint64_t)v7, v8);
      }
    }
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v9 = (void *)getMKMapItemClass_softClass;
    uint64_t v18 = getMKMapItemClass_softClass;
    if (!getMKMapItemClass_softClass)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __getMKMapItemClass_block_invoke;
      v14[3] = &unk_1E64A45A0;
      v14[4] = &v15;
      __getMKMapItemClass_block_invoke((uint64_t)v14);
      v9 = (void *)v16[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v15, 8);
    v11 = [v6 decodeObjectOfClass:v10 forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)addLocation
{
  v3 = [(ICAttachmentModel *)self attachment];
  id v4 = +[ICAttachmentLocation newAttachmentLocationForAttachment:v3];
  v5 = [(ICAttachmentModel *)self attachment];
  [v5 setLocation:v4];

  id v11 = [(ICAttachmentMapModel *)self MKMapItem];
  v6 = [v11 placemark];

  id v7 = [(ICAttachmentModel *)self attachment];
  v8 = [v7 location];
  if (v6)
  {
    v9 = [v11 placemark];
    [v8 setLocationFromPlacemark:v9];
  }
  else
  {
    v9 = [(ICAttachmentModel *)self attachment];
    id v10 = [v9 URL];
    [v8 setLocationFromURL:v10];
  }
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  v6 = [(ICAttachmentModel *)self attachment];
  id v7 = [v6 urlString];

  *a3 = @"a";
  id v8 = v7;
  *a4 = v8;
  v9 = [NSString stringWithFormat:@"href=%@", v8];

  return v9;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 1;
}

- (BOOL)shouldSyncPreviewImageToCloud:(id)a3
{
  return [a3 appearanceType] == 0;
}

- (void)MKMapItem
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Exception decoding map item: %@", (uint8_t *)&v2, 0xCu);
}

@end