@interface PKDiscoveryArticleLayout
+ (BOOL)supportsSecureCoding;
- (BOOL)entitledToForceLargeCard;
- (BOOL)hasHitMaxLargeViewCount;
- (BOOL)hasRequestedBadge;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualForUI:(id)a3;
- (NSArray)shelves;
- (NSString)itemIdentifier;
- (PKDiscoveryArticleLayout)initWithCoder:(id)a3;
- (PKDiscoveryArticleLayout)initWithDictionary:(id)a3;
- (PKDiscoveryCallToAction)footerLockup;
- (PKDiscoveryCard)card;
- (PKDiscoveryItem)item;
- (PKMiniDiscoveryCard)miniCard;
- (id)actionOnDismiss;
- (id)description;
- (int64_t)priority;
- (int64_t)variant;
- (int64_t)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)localizeWithBundle:(id)a3;
- (void)localizeWithBundle:(id)a3 table:(id)a4;
- (void)setActionOnDismiss:(id)a3;
- (void)setItem:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation PKDiscoveryArticleLayout

- (PKDiscoveryArticleLayout)initWithDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKDiscoveryArticleLayout;
  v5 = [(PKDiscoveryArticleLayout *)&v34 init];
  if (v5)
  {
    v5->_version = [v4 PKIntegerForKey:@"version"];
    v28 = [v4 PKDictionaryForKey:@"card"];
    v6 = [[PKDiscoveryCard alloc] initWithDictionary:v28];
    card = v5->_card;
    v5->_card = v6;

    v8 = [v4 PKDictionaryForKey:@"miniCard"];
    v9 = [[PKMiniDiscoveryCard alloc] initWithDictionary:v8];
    miniCard = v5->_miniCard;
    v5->_miniCard = v9;

    v11 = [v4 PKArrayContaining:objc_opt_class() forKey:@"shelves"];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = +[PKDiscoveryShelf shelfWithDictionary:*(void *)(*((void *)&v30 + 1) + 8 * v17)];
          if (!v18)
          {
            v26 = PKLogFacilityTypeGetObject(0x10uLL);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Received malformed Discovery Article Layout Bundle: failed to initialize discovery shelf", buf, 2u);
            }

            v25 = 0;
            goto LABEL_15;
          }
          v19 = (void *)v18;
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v20 = [v12 copy];
    shelves = v5->_shelves;
    v5->_shelves = (NSArray *)v20;

    v22 = [v4 PKDictionaryForKey:@"footerLockup"];
    v23 = [[PKDiscoveryCallToAction alloc] initWithDictionary:v22];
    footerLockup = v5->_footerLockup;
    v5->_footerLockup = v23;

    v5->_priority = 500;
  }
  v25 = v5;
LABEL_15:

  return v25;
}

- (void)localizeWithBundle:(id)a3
{
  id v4 = a3;
  [(PKDiscoveryCard *)self->_card localizeWithBundle:v4];
  [(PKDiscoveryCard *)self->_miniCard localizeWithBundle:v4];
  shelves = self->_shelves;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PKDiscoveryArticleLayout_localizeWithBundle___block_invoke;
  v7[3] = &unk_1E56DDCD0;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)shelves enumerateObjectsUsingBlock:v7];
}

uint64_t __47__PKDiscoveryArticleLayout_localizeWithBundle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizeWithBundle:*(void *)(a1 + 32)];
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PKDiscoveryCard *)self->_card localizeWithBundle:v6 table:v7];
  [(PKDiscoveryCard *)self->_miniCard localizeWithBundle:v6 table:v7];
  shelves = self->_shelves;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PKDiscoveryArticleLayout_localizeWithBundle_table___block_invoke;
  v11[3] = &unk_1E56DDCF8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NSArray *)shelves enumerateObjectsUsingBlock:v11];
}

uint64_t __53__PKDiscoveryArticleLayout_localizeWithBundle_table___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizeWithBundle:*(void *)(a1 + 32) table:*(void *)(a1 + 40)];
}

- (void)setItem:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    id v6 = [v11 identifier];
    itemIdentifier = self->_itemIdentifier;
    self->_itemIdentifier = v6;

    if ([v11 viewCount]) {
      char v8 = 0;
    }
    else {
      char v8 = [v11 shouldBadge];
    }
    self->_requestedBadge = v8;
    self->_priority = [v11 priority];
    self->_entitledToForceLargeCard = [v11 entitledToForceLargeCard];
    self->_hitMaxLargeViewCount = [v11 hasHitMaxLargeViewCount];
    card = self->_card;
    if (card) {
      [(PKDiscoveryCard *)card setItem:v11];
    }
    footerLockup = self->_footerLockup;
    id v5 = v11;
    if (footerLockup)
    {
      [(PKDiscoveryCallToAction *)footerLockup setItem:v11];
      id v5 = v11;
    }
  }
}

- (BOOL)isEqualForUI:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_29;
  }
  itemIdentifier = self->_itemIdentifier;
  id v6 = (NSString *)v4[2];
  if (itemIdentifier && v6)
  {
    if ((-[NSString isEqual:](itemIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (itemIdentifier != v6)
  {
    goto LABEL_29;
  }
  if (self->_version != v4[3]
    || self->_variant != v4[4]
    || self->_priority != v4[9]
    || self->_entitledToForceLargeCard != *((unsigned __int8 *)v4 + 8)
    || self->_hitMaxLargeViewCount != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_29;
  }
  card = self->_card;
  char v8 = (PKDiscoveryCard *)v4[5];
  if (card && v8)
  {
    if (!-[PKDiscoveryCard isEqual:](card, "isEqual:")) {
      goto LABEL_29;
    }
  }
  else if (card != v8)
  {
    goto LABEL_29;
  }
  shelves = self->_shelves;
  id v10 = (NSArray *)v4[7];
  if (shelves && v10)
  {
    if ((-[NSArray isEqual:](shelves, "isEqual:") & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (shelves != v10)
  {
    goto LABEL_29;
  }
  footerLockup = self->_footerLockup;
  id v12 = (PKDiscoveryCallToAction *)v4[8];
  if (!footerLockup || !v12)
  {
    if (footerLockup == v12) {
      goto LABEL_25;
    }
LABEL_29:
    BOOL v15 = 0;
    goto LABEL_30;
  }
  if (!-[PKDiscoveryCallToAction isEqual:](footerLockup, "isEqual:")) {
    goto LABEL_29;
  }
LABEL_25:
  miniCard = self->_miniCard;
  uint64_t v14 = (PKMiniDiscoveryCard *)v4[6];
  if (miniCard && v14) {
    BOOL v15 = -[PKMiniDiscoveryCard isEqual:](miniCard, "isEqual:");
  }
  else {
    BOOL v15 = miniCard == v14;
  }
LABEL_30:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([(PKDiscoveryArticleLayout *)self isEqualForUI:v4]) {
    BOOL v5 = self->_requestedBadge ^ (v4[10] == 0);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_itemIdentifier];
  [v3 safelyAddObject:self->_card];
  [v3 safelyAddObject:self->_shelves];
  [v3 safelyAddObject:self->_footerLockup];
  [v3 safelyAddObject:self->_miniCard];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_version - v4 + 32 * v4;
  int64_t v6 = self->_variant - v5 + 32 * v5;
  uint64_t v7 = self->_requestedBadge - v6 + 32 * v6;
  int64_t v8 = self->_priority - v7 + 32 * v7;
  uint64_t v9 = self->_entitledToForceLargeCard - v8 + 32 * v8;
  unint64_t v10 = self->_hitMaxLargeViewCount - v9 + 32 * v9;

  return v10;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"identifier", self->_itemIdentifier];
  [v3 appendFormat:@"%@: '%ld'; ", @"version", self->_version];
  [v3 appendFormat:@"%@: '%ld'; ", @"variant", self->_variant];
  [v3 appendFormat:@"%@: '%@'; ", @"card", self->_card];
  [v3 appendFormat:@"%@: '%@'; ", @"shelves", self->_shelves];
  [v3 appendFormat:@"%@: '%@'; ", @"footerLockup", self->_footerLockup];
  if (self->_requestedBadge) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"requestedBadge", v4];
  [v3 appendFormat:@"%@: '%ld'; ", @"priority", self->_priority];
  if (self->_entitledToForceLargeCard) {
    int64_t v5 = @"YES";
  }
  else {
    int64_t v5 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"entitledToForceLargeCard", v5];
  if (self->_hitMaxLargeViewCount) {
    int64_t v6 = @"YES";
  }
  else {
    int64_t v6 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"hitMaxLargeViewCount", v6];
  [v3 appendFormat:@"%@: '%@'; ", @"miniCard", self->_miniCard];
  [v3 appendFormat:@">"];
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  itemIdentifier = self->_itemIdentifier;
  id v5 = a3;
  [v5 encodeObject:itemIdentifier forKey:@"identifier"];
  [v5 encodeObject:self->_item forKey:@"item"];
  [v5 encodeInteger:self->_version forKey:@"version"];
  [v5 encodeInteger:self->_variant forKey:@"variant"];
  [v5 encodeObject:self->_card forKey:@"card"];
  [v5 encodeObject:self->_shelves forKey:@"shelves"];
  [v5 encodeObject:self->_footerLockup forKey:@"footerLockup"];
  [v5 encodeBool:self->_requestedBadge forKey:@"requestedBadge"];
  [v5 encodeInteger:self->_priority forKey:@"priority"];
  [v5 encodeBool:self->_entitledToForceLargeCard forKey:@"entitledToForceLargeCard"];
  [v5 encodeBool:self->_hitMaxLargeViewCount forKey:@"hitMaxLargeViewCount"];
  [v5 encodeObject:self->_miniCard forKey:@"miniCard"];
}

- (PKDiscoveryArticleLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKDiscoveryArticleLayout;
  id v5 = [(PKDiscoveryArticleLayout *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"item"];
    item = v5->_item;
    v5->_item = (PKDiscoveryItem *)v8;

    v5->_version = [v4 decodeIntegerForKey:@"version"];
    v5->_variant = [v4 decodeIntegerForKey:@"variant"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"card"];
    card = v5->_card;
    v5->_card = (PKDiscoveryCard *)v10;

    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"shelves"];
    shelves = v5->_shelves;
    v5->_shelves = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footerLockup"];
    footerLockup = v5->_footerLockup;
    v5->_footerLockup = (PKDiscoveryCallToAction *)v17;

    v5->_requestedBadge = [v4 decodeBoolForKey:@"requestedBadge"];
    v5->_priority = [v4 decodeIntegerForKey:@"priority"];
    v5->_entitledToForceLargeCard = [v4 decodeBoolForKey:@"entitledToForceLargeCard"];
    v5->_hitMaxLargeViewCount = [v4 decodeBoolForKey:@"hitMaxLargeViewCount"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"miniCard"];
    miniCard = v5->_miniCard;
    v5->_miniCard = (PKMiniDiscoveryCard *)v19;
  }
  return v5;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (BOOL)entitledToForceLargeCard
{
  return self->_entitledToForceLargeCard;
}

- (BOOL)hasHitMaxLargeViewCount
{
  return self->_hitMaxLargeViewCount;
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)variant
{
  return self->_variant;
}

- (PKDiscoveryCard)card
{
  return self->_card;
}

- (PKMiniDiscoveryCard)miniCard
{
  return self->_miniCard;
}

- (NSArray)shelves
{
  return self->_shelves;
}

- (PKDiscoveryCallToAction)footerLockup
{
  return self->_footerLockup;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (id)actionOnDismiss
{
  return self->_actionOnDismiss;
}

- (void)setActionOnDismiss:(id)a3
{
}

- (BOOL)hasRequestedBadge
{
  return self->_requestedBadge;
}

- (PKDiscoveryItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong(&self->_actionOnDismiss, 0);
  objc_storeStrong((id *)&self->_footerLockup, 0);
  objc_storeStrong((id *)&self->_shelves, 0);
  objc_storeStrong((id *)&self->_miniCard, 0);
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end