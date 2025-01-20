@interface PXRecipient
+ (id)_contactForAddress:(id)a3 recipientKind:(int64_t)a4;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (NSSet)allEmails;
- (NSSet)allPhones;
- (NSSet)unformattedAllPhones;
- (NSString)description;
- (NSString)emailAddressString;
- (NSString)firstName;
- (NSString)invalidAddressString;
- (NSString)lastName;
- (NSString)localizedName;
- (NSString)phoneNumberString;
- (PXRecipient)init;
- (PXRecipient)initWithAddress:(id)a3 nameComponents:(id)a4 recipientKind:(int64_t)a5;
- (PXRecipient)initWithContact:(id)a3 address:(id)a4 nameComponents:(id)a5 recipientKind:(int64_t)a6;
- (PXRecipient)initWithEmailAddress:(id)a3 phoneNumber:(id)a4 nameComponents:(id)a5;
- (PXRecipientTransport)suggestedTransport;
- (unint64_t)hash;
- (void)px_requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6;
- (void)setSuggestedTransport:(id)a3;
@end

@implementation PXRecipient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidAddressString, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_suggestedTransport, 0);
  objc_storeStrong((id *)&self->_emailAddressString, 0);
  objc_storeStrong((id *)&self->_phoneNumberString, 0);
  objc_storeStrong((id *)&self->_unformattedAllPhones, 0);
  objc_storeStrong((id *)&self->_allPhones, 0);
  objc_storeStrong((id *)&self->_allEmails, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

- (NSString)invalidAddressString
{
  return self->_invalidAddressString;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setSuggestedTransport:(id)a3
{
}

- (PXRecipientTransport)suggestedTransport
{
  return self->_suggestedTransport;
}

- (NSString)emailAddressString
{
  return self->_emailAddressString;
}

- (NSString)phoneNumberString
{
  return self->_phoneNumberString;
}

- (NSSet)unformattedAllPhones
{
  return self->_unformattedAllPhones;
}

- (NSSet)allPhones
{
  return self->_allPhones;
}

- (NSSet)allEmails
{
  return self->_allEmails;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(PXRecipient *)self localizedName];
  v5 = [(PXRecipient *)self allEmails];
  v6 = [(PXRecipient *)self allPhones];
  v7 = [(PXRecipient *)self suggestedTransport];
  v8 = [v3 stringWithFormat:@"localizedName %@ emails %@ phones %@ suggestedTransport %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  v3 = [(PXRecipient *)self firstName];
  uint64_t v4 = [v3 hash];
  v5 = [(PXRecipient *)self lastName];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(PXRecipient *)self allPhones];
  uint64_t v8 = [v7 hash];
  v9 = [(PXRecipient *)self allEmails];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PXRecipient *)self firstName];
    id v7 = [v5 firstName];
    if (v6 == v7)
    {
    }
    else
    {
      int v8 = [v6 isEqualToString:v7];

      if (!v8)
      {
        char v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    id v10 = [(PXRecipient *)self lastName];
    id v11 = [v5 lastName];
    if (v10 == v11)
    {
    }
    else
    {
      int v12 = [v10 isEqualToString:v11];

      if (!v12)
      {
        char v9 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    v13 = [(PXRecipient *)self allPhones];
    uint64_t v14 = [v5 allPhones];
    v15 = (void *)v14;
    if (v13 == (void *)v14)
    {
      v26 = (void *)v14;
    }
    else
    {
      v16 = [(PXRecipient *)self allPhones];
      v27 = [v5 allPhones];
      if (!objc_msgSend(v16, "isEqualToSet:"))
      {
        char v9 = 0;
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      v25 = v16;
      v26 = v15;
    }
    v17 = [(PXRecipient *)self allEmails];
    uint64_t v18 = [v5 allEmails];
    if (v17 == (void *)v18)
    {

      char v9 = 1;
    }
    else
    {
      v19 = (void *)v18;
      [(PXRecipient *)self allEmails];
      v20 = v23 = v13;
      [v5 allEmails];
      v21 = v24 = v10;
      char v9 = [v20 isEqualToSet:v21];

      id v10 = v24;
      v13 = v23;
    }
    v16 = v25;
    v15 = v26;
    if (v13 == v26) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  char v9 = 0;
LABEL_24:

  return v9;
}

- (PXRecipient)initWithContact:(id)a3 address:(id)a4 nameComponents:(id)a5 recipientKind:(int64_t)a6
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  id v13 = a5;
  if (!(v11 | v12))
  {
    v91 = [MEMORY[0x1E4F28B00] currentHandler];
    [v91 handleFailureInMethod:a2, self, @"PXRecipient.m", 116, @"Invalid parameter not satisfying: %@", @"providedContact != nil || providedAddress != nil" object file lineNumber description];
  }
  v111.receiver = self;
  v111.super_class = (Class)PXRecipient;
  uint64_t v14 = [(PXRecipient *)&v111 init];
  if (v14)
  {
    id v15 = (id)v11;
    id v93 = v15;
    if (v11
      || ([(id)objc_opt_class() _contactForAddress:v12 recipientKind:a6],
          (id v15 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_storeStrong((id *)&v14->_contact, v15);
      v16 = (objc_class *)MEMORY[0x1E4F28F30];
      id v17 = v15;
      id v18 = objc_alloc_init(v16);
      v19 = [v17 givenName];
      [v18 setGivenName:v19];

      v20 = [v17 familyName];

      [v18 setFamilyName:v20];
      v21 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v18 style:0 options:0];

      uint64_t v22 = [v21 copy];
      localizedName = v14->_localizedName;
      v14->_localizedName = (NSString *)v22;

      int64_t v95 = a6;
      if ([(NSString *)v14->_localizedName length]) {
        v24 = v14->_localizedName;
      }
      else {
        v24 = (NSString *)[(id)v12 copy];
      }
      v25 = v14->_localizedName;
      v14->_localizedName = v24;

      uint64_t v26 = [v17 givenName];
      firstName = v14->_firstName;
      v14->_firstName = (NSString *)v26;

      uint64_t v28 = [v17 familyName];
      lastName = v14->_lastName;
      v14->_lastName = (NSString *)v28;

      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v100 = [MEMORY[0x1E4F1CA80] set];
      v102 = v14;
      id v96 = v13;
      id v94 = v17;
      if ([v17 isKeyAvailable:*MEMORY[0x1E4F1ADC8]])
      {
        v31 = [v17 emailAddresses];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v107 objects:v119 count:16];
        if (!v32) {
          goto LABEL_24;
        }
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v108;
        while (1)
        {
          uint64_t v35 = 0;
          do
          {
            if (*(void *)v108 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = [*(id *)(*((void *)&v107 + 1) + 8 * v35) value];
            BOOL v37 = +[PXRecipientTransportUtilities px_IsValidEmailAddress:v36];
            v38 = v30;
            if (v37)
            {
              if (v12)
              {
                BOOL v39 = +[PXRecipientTransportUtilities px_IsEmailAddress:v36 equalToEmailAddress:v12];
                v38 = v100;
                if (!v39) {
                  goto LABEL_19;
                }
LABEL_18:
                uint64_t v40 = [v36 copy];
                emailAddressString = v102->_emailAddressString;
                v102->_emailAddressString = (NSString *)v40;

                v38 = v100;
                goto LABEL_19;
              }
              v38 = v100;
              if (!v102->_emailAddressString) {
                goto LABEL_18;
              }
            }
LABEL_19:
            [v38 addObject:v36];

            ++v35;
          }
          while (v33 != v35);
          uint64_t v42 = [v31 countByEnumeratingWithState:&v107 objects:v119 count:16];
          uint64_t v33 = v42;
          if (!v42)
          {
LABEL_24:

            uint64_t v14 = v102;
            id v17 = v94;
            break;
          }
        }
      }
      uint64_t v43 = [v100 copy];
      allEmails = v14->_allEmails;
      v14->_allEmails = (NSSet *)v43;

      v99 = [MEMORY[0x1E4F1CA80] set];
      v98 = [MEMORY[0x1E4F1CA80] set];
      if (![v17 isKeyAvailable:*MEMORY[0x1E4F1AEE0]]) {
        goto LABEL_46;
      }
      v97 = v30;
      v45 = [v17 phoneNumbers];
      unint64_t v92 = v12;
      v46 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v12];
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v47 = v45;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v103 objects:v118 count:16];
      if (!v48) {
        goto LABEL_45;
      }
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v104;
LABEL_28:
      uint64_t v51 = 0;
      while (1)
      {
        if (*(void *)v104 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = [*(id *)(*((void *)&v103 + 1) + 8 * v51) value];
        v53 = [v52 formattedStringValue];
        v54 = +[PXRecipientTransportUtilities px_validPhoneNumberFromString:v53];
        v55 = v54;
        if (!v54)
        {
          if (v53) {
            [v97 addObject:v53];
          }
          goto LABEL_43;
        }
        if (v46) {
          break;
        }
        if (!v102->_phoneNumberString)
        {
          uint64_t v59 = [v54 copy];
          phoneNumberString = v102->_phoneNumberString;
          v102->_phoneNumberString = (NSString *)v59;
LABEL_39:
        }
        [v99 addObject:v55];
        v60 = [v52 unformattedInternationalStringValue];
        if (v60) {
          [v98 addObject:v60];
        }

LABEL_43:
        if (v49 == ++v51)
        {
          uint64_t v49 = [v47 countByEnumeratingWithState:&v103 objects:v118 count:16];
          if (!v49)
          {
LABEL_45:

            unint64_t v12 = v92;
            id v13 = v96;
            id v30 = v97;
            uint64_t v14 = v102;
            id v17 = v94;
LABEL_46:
            uint64_t v61 = [v99 copy];
            allPhones = v14->_allPhones;
            v14->_allPhones = (NSSet *)v61;

            uint64_t v63 = [v98 copy];
            unformattedAllPhones = v14->_unformattedAllPhones;
            v14->_unformattedAllPhones = (NSSet *)v63;

            a6 = v95;
LABEL_47:

            goto LABEL_48;
          }
          goto LABEL_28;
        }
      }
      phoneNumberString = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v54];
      if ([phoneNumberString isLikePhoneNumber:v46])
      {
        uint64_t v57 = [v55 copy];
        v58 = v102->_phoneNumberString;
        v102->_phoneNumberString = (NSString *)v57;
      }
      goto LABEL_39;
    }
    if (v13)
    {
      id v71 = objc_alloc_init(MEMORY[0x1E4F28F38]);
      [v71 setStyle:0];
      uint64_t v72 = [v71 stringFromPersonNameComponents:v13];
      v73 = v14->_localizedName;
      v14->_localizedName = (NSString *)v72;
    }
    uint64_t v74 = +[PXRecipientTransportUtilities px_validPhoneNumberFromString:v12];
    if (v74)
    {
      id v30 = (id)v74;
      uint64_t v75 = [MEMORY[0x1E4F1CAD0] setWithObject:v74];
      v76 = v14->_allPhones;
      v14->_allPhones = (NSSet *)v75;

      uint64_t v77 = [v30 copy];
      v78 = v14->_phoneNumberString;
      v14->_phoneNumberString = (NSString *)v77;

      v79 = v14->_localizedName;
      if (!v79) {
        v79 = v14->_phoneNumberString;
      }
      objc_storeStrong((id *)&v14->_localizedName, v79);
      v100 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v30];
      v80 = [v100 unformattedInternationalStringValue];
      if (v80)
      {
        uint64_t v81 = [MEMORY[0x1E4F1CAD0] setWithObject:v80];
        v82 = v14->_unformattedAllPhones;
        v14->_unformattedAllPhones = (NSSet *)v81;
      }
      id v17 = 0;
      goto LABEL_47;
    }
    if (+[PXRecipientTransportUtilities px_IsValidEmailAddress:v12])
    {
      uint64_t v85 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
      v86 = v14->_allEmails;
      v14->_allEmails = (NSSet *)v85;

      uint64_t v87 = [(id)v12 copy];
      v88 = v14->_emailAddressString;
      v14->_emailAddressString = (NSString *)v87;

      v89 = v14->_localizedName;
      if (!v89) {
        v89 = v14->_emailAddressString;
      }
      v90 = v89;
      id v30 = 0;
      id v17 = 0;
      v101 = v14->_localizedName;
      v14->_localizedName = v90;
    }
    else
    {
      id v30 = 0;
      id v17 = 0;
    }
LABEL_48:

    if ([(NSString *)v14->_phoneNumberString length])
    {
      v65 = [PXRecipientTransport alloc];
      v66 = v14->_phoneNumberString;
      uint64_t v67 = 2;
    }
    else
    {
      if (![(NSString *)v14->_emailAddressString length])
      {
        v83 = PLUIGetLog();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v113 = v93;
          __int16 v114 = 2112;
          unint64_t v115 = v12;
          __int16 v116 = 2048;
          int64_t v117 = a6;
          _os_log_impl(&dword_1A9AE7000, v83, OS_LOG_TYPE_ERROR, "No valid email address or phone number for the provided contact: \"%@\", address: \"%@\", kind: %ld", buf, 0x20u);
        }

        uint64_t v84 = [(id)v12 copy];
        invalidAddressString = (PXRecipientTransport *)v14->_invalidAddressString;
        v14->_invalidAddressString = (NSString *)v84;
        goto LABEL_53;
      }
      v65 = [PXRecipientTransport alloc];
      v66 = v14->_emailAddressString;
      uint64_t v67 = 1;
    }
    uint64_t v68 = [(PXRecipientTransport *)v65 initWithAddress:v66 addressKind:v67];
    invalidAddressString = v14->_suggestedTransport;
    v14->_suggestedTransport = (PXRecipientTransport *)v68;
LABEL_53:
  }
  return v14;
}

- (PXRecipient)initWithEmailAddress:(id)a3 phoneNumber:(id)a4 nameComponents:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  if ([v11 length])
  {
    uint64_t v12 = 1;
    id v13 = v11;
  }
  else
  {
    if (![v9 length])
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PXRecipient.m", 109, @"Invalid parameter not satisfying: %@", @"hasEmailAddress || (phoneNumber.length > 0)" object file lineNumber description];
    }
    uint64_t v12 = 2;
    id v13 = v9;
  }
  uint64_t v14 = [(PXRecipient *)self initWithContact:0 address:v13 nameComponents:v10 recipientKind:v12];

  return v14;
}

- (PXRecipient)initWithAddress:(id)a3 nameComponents:(id)a4 recipientKind:(int64_t)a5
{
  return [(PXRecipient *)self initWithContact:0 address:a3 nameComponents:a4 recipientKind:a5];
}

- (PXRecipient)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXRecipient.m", 96, @"%s is not available as initializer", "-[PXRecipient init]");

  abort();
}

+ (id)_contactForAddress:(id)a3 recipientKind:(int64_t)a4
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = 0;
  id v7 = 0;
  if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 3) > 0xFFFFFFFFFFFFFFFDLL) {
    goto LABEL_17;
  }
  id v6 = +[PXPeopleUtilities sharedContactStore];
  if (!a4) {
    a4 = +[PXRecipientTransportUtilities px_recipientKindFromString:v5];
  }
  if (a4 == 1)
  {
    id v9 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v5];
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    id v7 = 0;
    goto LABEL_17;
  }
  if (a4 != 2) {
    goto LABEL_10;
  }
  int v8 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v5];
  id v9 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v8];

  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v10 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  id v11 = (void *)v10;
  if (v10)
  {
    uint64_t v12 = *MEMORY[0x1E4F1ADC8];
    v28[0] = v10;
    v28[1] = v12;
    v28[2] = *MEMORY[0x1E4F1AEE0];
    id v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = v28;
    uint64_t v15 = 3;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F1AEE0];
    v27[0] = *MEMORY[0x1E4F1ADC8];
    v27[1] = v16;
    id v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = v27;
    uint64_t v15 = 2;
  }
  id v17 = [v13 arrayWithObjects:v14 count:v15];
  id v22 = 0;
  id v18 = [v6 unifiedContactsMatchingPredicate:v9 keysToFetch:v17 error:&v22];
  id v19 = v22;
  if (v19)
  {
    v20 = PLUIGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "+[PXRecipient _contactForAddress:recipientKind:]";
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "%s: Error while fetching contacts: %@", buf, 0x16u);
    }
  }
  id v7 = [v18 firstObject];

LABEL_17:
  return v7;
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXRecipient.m", 100, @"%s is not available as initializer", "+[PXRecipient new]");

  abort();
}

- (void)px_requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 resultHandler:(id)a6
{
  BOOL v6 = a5;
  double height = a3.height;
  double width = a3.width;
  id v12 = a6;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXRecipient+PXFaceTileImageCombinerItem.m", 20, @"Invalid parameter not satisfying: %@", @"!CGSizeEqualToSize(targetSize, CGSizeZero)" object file lineNumber description];
  }
  if (a4 <= 0.0)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXRecipient+PXFaceTileImageCombinerItem.m", 21, @"Invalid parameter not satisfying: %@", @"displayScale > 0" object file lineNumber description];

    if (v12) {
      goto LABEL_8;
    }
  }
  else if (v12)
  {
    goto LABEL_8;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PXRecipient+PXFaceTileImageCombinerItem.m", 22, @"Invalid parameter not satisfying: %@", @"resultHandler" object file lineNumber description];

LABEL_8:
  uint64_t v14 = [(PXRecipient *)self suggestedTransport];
  uint64_t v15 = [v14 addressKind];
  if (v15 == 1)
  {
    id v17 = [v14 address];
    uint64_t v16 = 0;
  }
  else
  {
    if (v15 == 2)
    {
      uint64_t v16 = [v14 address];
    }
    else
    {
      if (!v15)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2 object:self file:@"PXRecipient+PXFaceTileImageCombinerItem.m" lineNumber:35 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      uint64_t v16 = 0;
    }
    id v17 = 0;
  }
  id v18 = [(PXRecipient *)self firstName];
  id v19 = [(PXRecipient *)self lastName];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __107__PXRecipient_PXFaceTileImageCombinerItem__px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke;
  v25[3] = &unk_1E5DD25F8;
  id v26 = v12;
  id v20 = v12;
  +[PXActivityUtilities requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:](PXActivityUtilities, "requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:", v6, v17, v16, v18, v19, 1, width, height, a4, v25);
}

uint64_t __107__PXRecipient_PXFaceTileImageCombinerItem__px_requestImageWithTargetSize_displayScale_isRTL_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end