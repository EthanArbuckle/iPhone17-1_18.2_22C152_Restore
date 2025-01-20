@interface PFVideoMetadataBuilder
- (NSArray)metadataItems;
- (id)accessibilityDescriptionItem;
- (id)captionItem;
- (id)commonItemForKey:(id)a3 string:(id)a4;
- (id)creationDateItem;
- (id)keywordsItem;
- (id)locationItem;
- (id)titleItem;
- (id)videoDateFormatter;
@end

@implementation PFVideoMetadataBuilder

- (NSArray)metadataItems
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(PFVideoMetadataBuilder *)self titleItem];
  if (v4) {
    [v3 addObject:v4];
  }

  v5 = [(PFVideoMetadataBuilder *)self captionItem];
  if (v5) {
    [v3 addObject:v5];
  }

  v6 = [(PFVideoMetadataBuilder *)self locationItem];
  if (v6) {
    [v3 addObject:v6];
  }

  v7 = [(PFVideoMetadataBuilder *)self creationDateItem];
  if (v7) {
    [v3 addObject:v7];
  }

  v8 = [(PFVideoMetadataBuilder *)self keywordsItem];
  if (v8) {
    [v3 addObject:v8];
  }

  v9 = [(PFVideoMetadataBuilder *)self accessibilityDescriptionItem];
  if (v9) {
    [v3 addObject:v9];
  }

  v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (id)keywordsItem
{
  v2 = [(PFMetadataBuilder *)self combinedKeywordsAndPeople];
  if ([v2 count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F165A0]);
    [v3 setKeySpace:*MEMORY[0x1E4F15DF8]];
    [v3 setKey:*MEMORY[0x1E4F15E90]];
    v4 = (void *)[v2 copy];
    [v3 setValue:v4];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)videoDateFormatter
{
  if (videoDateFormatter_onceToken != -1) {
    dispatch_once(&videoDateFormatter_onceToken, &__block_literal_global_198);
  }
  v2 = (void *)videoDateFormatter_dateFormatter;

  return v2;
}

uint64_t __44__PFVideoMetadataBuilder_videoDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v1 = (void *)videoDateFormatter_dateFormatter;
  videoDateFormatter_dateFormatter = (uint64_t)v0;

  v2 = (void *)videoDateFormatter_dateFormatter;

  return [v2 setFormatOptions:1907];
}

- (id)creationDateItem
{
  id v3 = [(PFMetadataBuilder *)self creationDate];
  if (v3)
  {
    v4 = [(PFVideoMetadataBuilder *)self videoDateFormatter];
    v5 = [(PFMetadataBuilder *)self creationTimeZone];
    [v4 setTimeZone:v5];

    v6 = [v4 stringFromDate:v3];
    v7 = [(PFVideoMetadataBuilder *)self commonItemForKey:*MEMORY[0x1E4F15CA0] string:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)locationItem
{
  uint64_t v3 = *MEMORY[0x1E4F15CB0];
  v4 = [(PFMetadataBuilder *)self location];
  v5 = [v4 iso6709Notation];
  v6 = [(PFVideoMetadataBuilder *)self commonItemForKey:v3 string:v5];

  return v6;
}

- (id)accessibilityDescriptionItem
{
  uint64_t v3 = *MEMORY[0x1E4F15C88];
  v4 = [(PFMetadataBuilder *)self accessibilityDescription];
  v5 = [(PFVideoMetadataBuilder *)self commonItemForKey:v3 string:v4];

  return v5;
}

- (id)captionItem
{
  uint64_t v3 = *MEMORY[0x1E4F15CA8];
  v4 = [(PFMetadataBuilder *)self caption];
  v5 = [(PFVideoMetadataBuilder *)self commonItemForKey:v3 string:v4];

  return v5;
}

- (id)titleItem
{
  uint64_t v3 = *MEMORY[0x1E4F15CD0];
  v4 = [(PFMetadataBuilder *)self title];
  v5 = [(PFVideoMetadataBuilder *)self commonItemForKey:v3 string:v4];

  return v5;
}

- (id)commonItemForKey:(id)a3 string:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F165A0]);
    [v7 setKeySpace:*MEMORY[0x1E4F15DE0]];
    [v7 setKey:v5];
    [v7 setValue:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end