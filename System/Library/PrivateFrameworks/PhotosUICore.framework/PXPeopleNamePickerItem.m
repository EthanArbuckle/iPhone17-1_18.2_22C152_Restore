@interface PXPeopleNamePickerItem
+ (id)_defaultAttributes;
+ (id)_titleForAttributedString:(id)a3 range:(_NSRange)a4;
+ (id)new;
- (CNContact)contact;
- (NSAttributedString)subtitle;
- (NSAttributedString)title;
- (NSNumber)highlightRangeLocation;
- (NSString)identifier;
- (PHPerson)person;
- (PXPeopleNamePickerItem)init;
- (PXPeopleNamePickerItem)initWithContact:(id)a3 searchPrefix:(id)a4;
- (PXPeopleNamePickerItem)initWithPerson:(id)a3 searchPrefix:(id)a4;
@end

@implementation PXPeopleNamePickerItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_highlightRangeLocation, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (NSNumber)highlightRangeLocation
{
  return self->_highlightRangeLocation;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (CNContact)contact
{
  return self->_contact;
}

- (PHPerson)person
{
  return self->_person;
}

- (PXPeopleNamePickerItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeopleNamePickerItem.m", 136, @"%s is not available as initializer", "-[PXPeopleNamePickerItem init]");

  abort();
}

- (NSString)identifier
{
  v3 = [(PXPeopleNamePickerItem *)self person];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 localIdentifier];
  }
  else
  {
    v6 = [(PXPeopleNamePickerItem *)self contact];
    v5 = [v6 identifier];
  }
  return (NSString *)v5;
}

- (PXPeopleNamePickerItem)initWithContact:(id)a3 searchPrefix:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v68.receiver = self;
  v68.super_class = (Class)PXPeopleNamePickerItem;
  v9 = [(PXPeopleNamePickerItem *)&v68 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    person = v10->_person;
    v10->_person = 0;

    uint64_t v12 = +[PXPeopleNamePickerItem _defaultAttributes];
    v13 = [v7 givenName];
    uint64_t v48 = objc_msgSend(v13, "px_rangeOfPrefixIgnoringCaseAndDiacritics:", v8);

    v14 = [v7 familyName];
    uint64_t v47 = objc_msgSend(v14, "px_rangeOfPrefixIgnoringCaseAndDiacritics:", v8);

    v15 = [v7 middleName];
    uint64_t v46 = objc_msgSend(v15, "px_rangeOfPrefixIgnoringCaseAndDiacritics:", v8);

    v16 = [v7 namePrefix];
    uint64_t v17 = objc_msgSend(v16, "px_rangeOfPrefixIgnoringCaseAndDiacritics:", v8);

    v18 = [v7 nameSuffix];
    uint64_t v19 = objc_msgSend(v18, "px_rangeOfPrefixIgnoringCaseAndDiacritics:", v8);

    BOOL v20 = v19 != 0x7FFFFFFFFFFFFFFFLL;
    v45 = (void *)v12;
    v21 = [MEMORY[0x1E4F1B910] attributedStringFromContact:v7 style:0 defaultAttributes:v12];
    uint64_t v22 = [v21 length];
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__114981;
    v66 = __Block_byref_object_dispose__114982;
    id v67 = (id)[v21 copy];
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x3010000000;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    v59 = &unk_1AB5D584F;
    uint64_t v23 = *MEMORY[0x1E4F1AF48];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __55__PXPeopleNamePickerItem_initWithContact_searchPrefix___block_invoke;
    v49[3] = &unk_1E5DBB258;
    id v24 = v21;
    id v50 = v24;
    id v25 = v8;
    v26.i64[0] = v46;
    v26.i64[1] = v17;
    id v51 = v25;
    v52 = &v56;
    v27.i64[0] = v48;
    v27.i64[1] = v47;
    int64x2_t v28 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v53 = &v62;
    int16x8_t v29 = (int16x8_t)vuzp1q_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_s64(v27, v28)), (int32x4_t)vmvnq_s8((int8x16_t)vceqq_s64(v26, v28)));
    *(int8x8_t *)v29.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v29), (int8x8_t)0x1000100010001);
    unsigned __int32 v54 = vmovn_s16(v29).u32[0];
    BOOL v55 = v20;
    objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v22, 0, v49);
    objc_storeStrong((id *)&v10->_title, (id)v63[5]);
    uint64_t v30 = [NSNumber numberWithUnsignedLong:v57[4]];
    highlightRangeLocation = v10->_highlightRangeLocation;
    v10->_highlightRangeLocation = (NSNumber *)v30;

    v32 = [v7 emailAddresses];
    if ([v32 count])
    {
      v33 = [v32 firstObject];
      id v34 = objc_alloc(MEMORY[0x1E4F28B18]);
      v35 = [v33 value];
      uint64_t v36 = [v34 initWithString:v35 attributes:v45];
      subtitle = v10->_subtitle;
      v10->_subtitle = (NSAttributedString *)v36;
    }
    if (![(NSAttributedString *)v10->_subtitle length])
    {
      v38 = [v7 phoneNumbers];
      v39 = [v38 firstObject];
      v40 = [v39 value];
      v41 = [v40 stringValue];
      if ([v41 length])
      {
        uint64_t v42 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v41 attributes:v45];
        v43 = v10->_subtitle;
        v10->_subtitle = (NSAttributedString *)v42;
      }
    }

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v62, 8);
  }
  return v10;
}

void __55__PXPeopleNamePickerItem_initWithContact_searchPrefix___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = [*(id *)(a1 + 32) string];
  uint64_t v4 = objc_msgSend(v3, "px_rangeOfSubstringIgnoringCaseAndDiacritics:", *(void *)(a1 + 40));
  uint64_t v6 = v5;

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v7 + 32) = 0;
    *(void *)(v7 + 40) = 0;
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v8 + 32) = v4;
    *(void *)(v8 + 40) = v6;
    if ([v12 isEqualToString:*MEMORY[0x1E4F1ADF0]] && *(unsigned char *)(a1 + 64)
      || [v12 isEqualToString:*MEMORY[0x1E4F1ADE0]] && *(unsigned char *)(a1 + 65)
      || [v12 isEqualToString:*MEMORY[0x1E4F1AEA0]] && *(unsigned char *)(a1 + 66)
      || [v12 isEqualToString:*MEMORY[0x1E4F1AEB0]] && *(unsigned char *)(a1 + 67)
      || [v12 isEqualToString:*MEMORY[0x1E4F1AEB8]] && *(unsigned char *)(a1 + 68))
    {
      uint64_t v9 = +[PXPeopleNamePickerItem _titleForAttributedString:range:](PXPeopleNamePickerItem, "_titleForAttributedString:range:", *(void *)(a1 + 32), v4, v6);
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
}

- (PXPeopleNamePickerItem)initWithPerson:(id)a3 searchPrefix:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PXPeopleNamePickerItem;
  uint64_t v9 = [(PXPeopleNamePickerItem *)&v28 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    contact = v10->_contact;
    v10->_contact = 0;

    uint64_t v12 = [v7 name];
    v13 = (void *)v12;
    v14 = &stru_1F00B0030;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    v15 = v14;

    id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v17 = +[PXPeopleNamePickerItem _defaultAttributes];
    v18 = (void *)[v16 initWithString:v15 attributes:v17];

    uint64_t v19 = [(__CFString *)v15 px_rangeOfSubstringIgnoringCaseAndDiacritics:v8];
    uint64_t v21 = v20;

    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = v18;
    }
    else
    {
      +[PXPeopleNamePickerItem _titleForAttributedString:range:](PXPeopleNamePickerItem, "_titleForAttributedString:range:", v18, v19, v21);
      uint64_t v22 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    }
    title = v10->_title;
    v10->_title = v22;

    uint64_t v24 = [NSNumber numberWithUnsignedLong:v19];
    highlightRangeLocation = v10->_highlightRangeLocation;
    v10->_highlightRangeLocation = (NSNumber *)v24;

    subtitle = v10->_subtitle;
    v10->_subtitle = 0;
  }
  return v10;
}

+ (id)new
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXPeopleNamePickerItem.m", 140, @"%s is not available as initializer", "+[PXPeopleNamePickerItem new]");

  abort();
}

+ (id)_titleForAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v6 = (void *)[a3 mutableCopy];
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  id v8 = [MEMORY[0x1E4FB1618] labelColor];
  objc_msgSend(v6, "addAttribute:value:range:", v7, v8, location, length);

  uint64_t v9 = (void *)[v6 copy];
  return v9;
}

+ (id)_defaultAttributes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FB0700];
  v2 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

@end