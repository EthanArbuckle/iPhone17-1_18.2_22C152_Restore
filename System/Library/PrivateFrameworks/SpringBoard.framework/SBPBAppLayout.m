@interface SBPBAppLayout
+ (uint64_t)displayItemLayoutAttributesType;
+ (uint64_t)displayItemsType;
- (BOOL)hasCenterDisplayItem;
- (BOOL)hasCenterLayoutAttributes;
- (BOOL)hasContinuousExposeIdentifier;
- (BOOL)hasPrimaryDisplayItem;
- (BOOL)hasPrimaryLayoutAttributes;
- (BOOL)hasSecondaryDisplayItem;
- (BOOL)hasSecondaryLayoutAttributes;
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)centerConfigurationAsString:(__CFString *)a1;
- (__CFString)environmentAsString:(__CFString *)a1;
- (__CFString)layoutConfigurationAsString:(__CFString *)a1;
- (__CFString)secondaryDisplayItemRoleAsString:(__CFString *)a1;
- (double)relativeHeight;
- (double)relativeWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayItemLayoutAttributesAtIndex:(id *)a1;
- (id)displayItemLayoutAttributesForNonPreferredDisplayAtIndex:(id *)a1;
- (id)displayItemsAtIndex:(id *)a1;
- (uint64_t)StringAsCenterConfiguration:(uint64_t)a1;
- (uint64_t)StringAsEnvironment:(uint64_t)a1;
- (uint64_t)StringAsLayoutConfiguration:(uint64_t)a1;
- (uint64_t)StringAsSecondaryDisplayItemRole:(uint64_t)a1;
- (uint64_t)centerConfiguration;
- (uint64_t)centerDisplayItem;
- (uint64_t)centerDisplayItemRole;
- (uint64_t)centerLayoutAttributes;
- (uint64_t)clearDisplayItemLayoutAttributes;
- (uint64_t)clearDisplayItemLayoutAttributesForNonPreferredDisplays;
- (uint64_t)clearDisplayItems;
- (uint64_t)continuousExposeIdentifier;
- (uint64_t)displayItemLayoutAttributes;
- (uint64_t)displayItemLayoutAttributesCount;
- (uint64_t)displayItemLayoutAttributesForNonPreferredDisplays;
- (uint64_t)displayItemLayoutAttributesForNonPreferredDisplaysCount;
- (uint64_t)displayItems;
- (uint64_t)displayItemsCount;
- (uint64_t)environment;
- (uint64_t)hasCenterDisplayItemRole;
- (uint64_t)hasSecondaryDisplayItemRole;
- (uint64_t)layoutConfiguration;
- (uint64_t)preferredDisplayOrdinal;
- (uint64_t)primaryDisplayItem;
- (uint64_t)primaryLayoutAttributes;
- (uint64_t)secondaryDisplayItem;
- (uint64_t)secondaryDisplayItemRole;
- (uint64_t)secondaryLayoutAttributes;
- (uint64_t)setCenterConfiguration:(uint64_t)result;
- (uint64_t)setCenterDisplayItemRole:(uint64_t)result;
- (uint64_t)setEnvironment:(uint64_t)result;
- (uint64_t)setHasCenterDisplayItemRole:(uint64_t)result;
- (uint64_t)setHasSecondaryDisplayItemRole:(uint64_t)result;
- (uint64_t)setHidden:(uint64_t)result;
- (uint64_t)setLayoutConfiguration:(uint64_t)result;
- (uint64_t)setPreferredDisplayOrdinal:(uint64_t)result;
- (uint64_t)setRelativeHeight:(uint64_t)result;
- (uint64_t)setRelativeWidth:(uint64_t)result;
- (uint64_t)setSecondaryDisplayItemRole:(uint64_t)result;
- (unint64_t)hash;
- (void)addDisplayItemLayoutAttributes:(uint64_t)a1;
- (void)addDisplayItemLayoutAttributesForNonPreferredDisplay:(uint64_t)a1;
- (void)addDisplayItems:(uint64_t)a1;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setCenterDisplayItem:(uint64_t)a1;
- (void)setCenterLayoutAttributes:(uint64_t)a1;
- (void)setContinuousExposeIdentifier:(uint64_t)a1;
- (void)setDisplayItemLayoutAttributes:(uint64_t)a1;
- (void)setDisplayItemLayoutAttributesForNonPreferredDisplays:(uint64_t)a1;
- (void)setDisplayItems:(uint64_t)a1;
- (void)setPrimaryDisplayItem:(uint64_t)a1;
- (void)setPrimaryLayoutAttributes:(uint64_t)a1;
- (void)setSecondaryDisplayItem:(uint64_t)a1;
- (void)setSecondaryLayoutAttributes:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation SBPBAppLayout

- (__CFString)layoutConfigurationAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E6B055F8[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsLayoutConfiguration:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Undefined"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Full"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"NarrowWide"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"HalfHalf"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"WideNarrow"])
    {
      uint64_t v6 = 4;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasPrimaryDisplayItem
{
  if (result) {
    return *(void *)(result + 104) != 0;
  }
  return result;
}

- (uint64_t)secondaryDisplayItemRole
{
  if (result)
  {
    if ((*(unsigned char *)(result + 148) & 2) != 0) {
      return *(unsigned int *)(result + 128);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setSecondaryDisplayItemRole:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 148) |= 2u;
    *(_DWORD *)(result + 128) = a2;
  }
  return result;
}

- (uint64_t)setHasSecondaryDisplayItemRole:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 148) = *(unsigned char *)(result + 148) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasSecondaryDisplayItemRole
{
  if (result) {
    return (*(unsigned __int8 *)(result + 148) >> 1) & 1;
  }
  return result;
}

- (__CFString)secondaryDisplayItemRoleAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E6B05640[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsSecondaryDisplayItemRole:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Undefined"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Primary"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Side"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"Floating"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"Center"])
    {
      uint64_t v6 = 4;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasSecondaryDisplayItem
{
  if (result) {
    return *(void *)(result + 120) != 0;
  }
  return result;
}

- (__CFString)environmentAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E6B05620[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsEnvironment:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Main"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Floating"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Inline"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"CenterModal"])
    {
      uint64_t v6 = 3;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)centerDisplayItemRole
{
  if (result)
  {
    if (*(unsigned char *)(result + 148)) {
      return *(unsigned int *)(result + 48);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setCenterDisplayItemRole:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 148) |= 1u;
    *(_DWORD *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)setHasCenterDisplayItemRole:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 148) = *(unsigned char *)(result + 148) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasCenterDisplayItemRole
{
  if (result) {
    return *(unsigned char *)(result + 148) & 1;
  }
  return result;
}

- (BOOL)hasCenterDisplayItem
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

- (__CFString)centerConfigurationAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E6B05668[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsCenterConfiguration:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Undefined"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Page"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"FullScreen"])
    {
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasPrimaryLayoutAttributes
{
  if (result) {
    return *(void *)(result + 112) != 0;
  }
  return result;
}

- (BOOL)hasSecondaryLayoutAttributes
{
  if (result) {
    return *(void *)(result + 136) != 0;
  }
  return result;
}

- (BOOL)hasCenterLayoutAttributes
{
  if (result) {
    return *(void *)(result + 56) != 0;
  }
  return result;
}

- (uint64_t)clearDisplayItems
{
  if (result) {
    return [*(id *)(result + 88) removeAllObjects];
  }
  return result;
}

- (void)addDisplayItems:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)displayItemsCount
{
  if (result) {
    return [*(id *)(result + 88) count];
  }
  return result;
}

- (id)displayItemsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[11] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)displayItemsType
{
  self;
  return objc_opt_class();
}

- (uint64_t)clearDisplayItemLayoutAttributes
{
  if (result) {
    return [*(id *)(result + 72) removeAllObjects];
  }
  return result;
}

- (void)addDisplayItemLayoutAttributes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)displayItemLayoutAttributesCount
{
  if (result) {
    return [*(id *)(result + 72) count];
  }
  return result;
}

- (id)displayItemLayoutAttributesAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[9] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)displayItemLayoutAttributesType
{
  self;
  return objc_opt_class();
}

- (BOOL)hasContinuousExposeIdentifier
{
  if (result) {
    return *(void *)(result + 64) != 0;
  }
  return result;
}

- (uint64_t)clearDisplayItemLayoutAttributesForNonPreferredDisplays
{
  if (result) {
    return [*(id *)(result + 80) removeAllObjects];
  }
  return result;
}

- (void)addDisplayItemLayoutAttributesForNonPreferredDisplay:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)displayItemLayoutAttributesForNonPreferredDisplaysCount
{
  if (result) {
    return [*(id *)(result + 80) count];
  }
  return result;
}

- (id)displayItemLayoutAttributesForNonPreferredDisplayAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[10] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SBPBAppLayout;
  v4 = [(SBPBAppLayout *)&v8 description];
  id v5 = [(SBPBAppLayout *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t layoutConfiguration = self->_layoutConfiguration;
  if (layoutConfiguration >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_layoutConfiguration);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_1E6B055F8[layoutConfiguration];
  }
  [v3 setObject:v5 forKey:@"layoutConfiguration"];

  primaryDisplayItem = self->_primaryDisplayItem;
  if (primaryDisplayItem)
  {
    id v7 = [(SBPBDisplayItem *)primaryDisplayItem dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"primaryDisplayItem"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t secondaryDisplayItemRole = self->_secondaryDisplayItemRole;
    if (secondaryDisplayItemRole >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_secondaryDisplayItemRole);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E6B05640[secondaryDisplayItemRole];
    }
    [v3 setObject:v9 forKey:@"secondaryDisplayItemRole"];
  }
  secondaryDisplayItem = self->_secondaryDisplayItem;
  if (secondaryDisplayItem)
  {
    v11 = [(SBPBDisplayItem *)secondaryDisplayItem dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"secondaryDisplayItem"];
  }
  uint64_t environment = self->_environment;
  if (environment >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_environment);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E6B05620[environment];
  }
  [v3 setObject:v13 forKey:@"environment"];

  v14 = [NSNumber numberWithBool:self->_hidden];
  [v3 setObject:v14 forKey:@"hidden"];

  if (*(unsigned char *)&self->_has)
  {
    uint64_t centerDisplayItemRole = self->_centerDisplayItemRole;
    if (centerDisplayItemRole >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_centerDisplayItemRole);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E6B05640[centerDisplayItemRole];
    }
    [v3 setObject:v16 forKey:@"centerDisplayItemRole"];
  }
  centerDisplayItem = self->_centerDisplayItem;
  if (centerDisplayItem)
  {
    v18 = [(SBPBDisplayItem *)centerDisplayItem dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"centerDisplayItem"];
  }
  uint64_t centerConfiguration = self->_centerConfiguration;
  if (centerConfiguration >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_centerConfiguration);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E6B05668[centerConfiguration];
  }
  [v3 setObject:v20 forKey:@"centerConfiguration"];

  v21 = [NSNumber numberWithDouble:self->_relativeWidth];
  [v3 setObject:v21 forKey:@"relativeWidth"];

  v22 = [NSNumber numberWithDouble:self->_relativeHeight];
  [v3 setObject:v22 forKey:@"relativeHeight"];

  primaryLayoutAttributes = self->_primaryLayoutAttributes;
  if (primaryLayoutAttributes)
  {
    v24 = [(SBPBDisplayItemLayoutAttributes *)primaryLayoutAttributes dictionaryRepresentation];
    [v3 setObject:v24 forKey:@"primaryLayoutAttributes"];
  }
  secondaryLayoutAttributes = self->_secondaryLayoutAttributes;
  if (secondaryLayoutAttributes)
  {
    v26 = [(SBPBDisplayItemLayoutAttributes *)secondaryLayoutAttributes dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"secondaryLayoutAttributes"];
  }
  centerLayoutAttributes = self->_centerLayoutAttributes;
  if (centerLayoutAttributes)
  {
    v28 = [(SBPBDisplayItemLayoutAttributes *)centerLayoutAttributes dictionaryRepresentation];
    [v3 setObject:v28 forKey:@"centerLayoutAttributes"];
  }
  if ([(NSMutableArray *)self->_displayItems count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_displayItems, "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v30 = self->_displayItems;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v62 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v61 + 1) + 8 * i) dictionaryRepresentation];
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v61 objects:v67 count:16];
      }
      while (v32);
    }

    [v3 setObject:v29 forKey:@"displayItems"];
  }
  if ([(NSMutableArray *)self->_displayItemLayoutAttributes count])
  {
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_displayItemLayoutAttributes, "count"));
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v37 = self->_displayItemLayoutAttributes;
    uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v58 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [*(id *)(*((void *)&v57 + 1) + 8 * j) dictionaryRepresentation];
          [v36 addObject:v42];
        }
        uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v39);
    }

    [v3 setObject:v36 forKey:@"displayItemLayoutAttributes"];
  }
  v43 = [NSNumber numberWithLongLong:self->_preferredDisplayOrdinal];
  [v3 setObject:v43 forKey:@"preferredDisplayOrdinal"];

  continuousExposeIdentifier = self->_continuousExposeIdentifier;
  if (continuousExposeIdentifier) {
    [v3 setObject:continuousExposeIdentifier forKey:@"continuousExposeIdentifier"];
  }
  if ([(NSMutableArray *)self->_displayItemLayoutAttributesForNonPreferredDisplays count])
  {
    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_displayItemLayoutAttributesForNonPreferredDisplays, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v46 = self->_displayItemLayoutAttributesForNonPreferredDisplays;
    uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v48; ++k)
        {
          if (*(void *)v54 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = [*(id *)(*((void *)&v53 + 1) + 8 * k) dictionaryRepresentation];
          [v45 addObject:v51];
        }
        uint64_t v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v48);
    }

    [v3 setObject:v45 forKey:@"displayItemLayoutAttributesForNonPreferredDisplay"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SBPBAppLayoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_primaryDisplayItem) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_secondaryDisplayItem) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_centerDisplayItem) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  if (self->_primaryLayoutAttributes) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_secondaryLayoutAttributes) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_centerLayoutAttributes) {
    PBDataWriterWriteSubmessage();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = self->_displayItems;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_displayItemLayoutAttributes;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  PBDataWriterWriteInt64Field();
  if (self->_continuousExposeIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = self->_displayItemLayoutAttributesForNonPreferredDisplays;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)copyTo:(uint64_t)a1
{
  long long v23 = a2;
  if (a1)
  {
    id v3 = v23;
    *((_DWORD *)v23 + 25) = *(_DWORD *)(a1 + 100);
    id v4 = *(void **)(a1 + 104);
    if (v4)
    {
      -[SBPBAppLayout setPrimaryDisplayItem:]((uint64_t)v23, v4);
      id v3 = v23;
    }
    if ((*(unsigned char *)(a1 + 148) & 2) != 0)
    {
      *((_DWORD *)v3 + 32) = *(_DWORD *)(a1 + 128);
      *((unsigned char *)v3 + 148) |= 2u;
    }
    id v5 = *(void **)(a1 + 120);
    if (v5)
    {
      -[SBPBAppLayout setSecondaryDisplayItem:]((uint64_t)v23, v5);
      id v3 = v23;
    }
    *((_DWORD *)v3 + 24) = *(_DWORD *)(a1 + 96);
    *((unsigned char *)v3 + 144) = *(unsigned char *)(a1 + 144);
    if (*(unsigned char *)(a1 + 148))
    {
      *((_DWORD *)v3 + 12) = *(_DWORD *)(a1 + 48);
      *((unsigned char *)v3 + 148) |= 1u;
    }
    uint64_t v6 = *(void **)(a1 + 40);
    if (v6)
    {
      -[SBPBAppLayout setCenterDisplayItem:]((uint64_t)v23, v6);
      id v3 = v23;
    }
    *((_DWORD *)v3 + 8) = *(_DWORD *)(a1 + 32);
    v3[3] = *(id *)(a1 + 24);
    v3[2] = *(id *)(a1 + 16);
    uint64_t v7 = *(void **)(a1 + 112);
    if (v7) {
      -[SBPBAppLayout setPrimaryLayoutAttributes:]((uint64_t)v23, v7);
    }
    uint64_t v8 = *(void **)(a1 + 136);
    if (v8) {
      -[SBPBAppLayout setSecondaryLayoutAttributes:]((uint64_t)v23, v8);
    }
    uint64_t v9 = *(void **)(a1 + 56);
    if (v9) {
      -[SBPBAppLayout setCenterLayoutAttributes:]((uint64_t)v23, v9);
    }
    if ([*(id *)(a1 + 88) count])
    {
      [v23[11] removeAllObjects];
      uint64_t v10 = [*(id *)(a1 + 88) count];
      if (v10)
      {
        uint64_t v11 = v10;
        for (uint64_t i = 0; i != v11; ++i)
        {
          uint64_t v13 = -[SBPBAppLayout displayItemsAtIndex:]((id *)a1, i);
          -[SBPBAppLayout addDisplayItems:]((uint64_t)v23, v13);
        }
      }
    }
    if ([*(id *)(a1 + 72) count])
    {
      if (v23) {
        [v23[9] removeAllObjects];
      }
      uint64_t v14 = [*(id *)(a1 + 72) count];
      if (v14)
      {
        uint64_t v15 = v14;
        for (uint64_t j = 0; j != v15; ++j)
        {
          uint64_t v17 = -[SBPBAppLayout displayItemLayoutAttributesAtIndex:]((id *)a1, j);
          -[SBPBAppLayout addDisplayItemLayoutAttributes:]((uint64_t)v23, v17);
        }
      }
    }
    v23[1] = *(id *)(a1 + 8);
    uint64_t v18 = *(void **)(a1 + 64);
    if (v18) {
      -[SBPBAppLayout setContinuousExposeIdentifier:]((uint64_t)v23, v18);
    }
    if ([*(id *)(a1 + 80) count])
    {
      [v23[10] removeAllObjects];
      uint64_t v19 = [*(id *)(a1 + 80) count];
      if (v19)
      {
        uint64_t v20 = v19;
        for (uint64_t k = 0; k != v20; ++k)
        {
          long long v22 = -[SBPBAppLayout displayItemLayoutAttributesForNonPreferredDisplayAtIndex:]((id *)a1, k);
          -[SBPBAppLayout addDisplayItemLayoutAttributesForNonPreferredDisplay:]((uint64_t)v23, v22);
        }
      }
    }
  }
}

- (void)setPrimaryDisplayItem:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (void)setSecondaryDisplayItem:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 120), a2);
  }
}

- (void)setCenterDisplayItem:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setPrimaryLayoutAttributes:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (void)setSecondaryLayoutAttributes:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 136), a2);
  }
}

- (void)setCenterLayoutAttributes:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setContinuousExposeIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 100) = self->_layoutConfiguration;
  id v6 = [(SBPBDisplayItem *)self->_primaryDisplayItem copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_secondaryDisplayItemRole;
    *(unsigned char *)(v5 + 148) |= 2u;
  }
  id v8 = [(SBPBDisplayItem *)self->_secondaryDisplayItem copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v8;

  *(_DWORD *)(v5 + 96) = self->_environment;
  *(unsigned char *)(v5 + 144) = self->_hidden;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_centerDisplayItemRole;
    *(unsigned char *)(v5 + 148) |= 1u;
  }
  id v10 = [(SBPBDisplayItem *)self->_centerDisplayItem copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  *(_DWORD *)(v5 + 32) = self->_centerConfiguration;
  *(double *)(v5 + 24) = self->_relativeWidth;
  *(double *)(v5 + 16) = self->_relativeHeight;
  id v12 = [(SBPBDisplayItemLayoutAttributes *)self->_primaryLayoutAttributes copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v12;

  id v14 = [(SBPBDisplayItemLayoutAttributes *)self->_secondaryLayoutAttributes copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v14;

  id v16 = [(SBPBDisplayItemLayoutAttributes *)self->_centerLayoutAttributes copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v18 = self->_displayItems;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v48;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v48 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * v22) copyWithZone:a3];
        -[SBPBAppLayout addDisplayItems:](v5, v23);

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v20);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v24 = self->_displayItemLayoutAttributes;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v44;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v28) copyWithZone:a3];
        -[SBPBAppLayout addDisplayItemLayoutAttributes:](v5, v29);

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v26);
  }

  *(void *)(v5 + 8) = self->_preferredDisplayOrdinal;
  uint64_t v30 = [(NSString *)self->_continuousExposeIdentifier copyWithZone:a3];
  long long v31 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v30;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v32 = self->_displayItemLayoutAttributesForNonPreferredDisplays;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v40;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * v36), "copyWithZone:", a3, (void)v39);
        -[SBPBAppLayout addDisplayItemLayoutAttributesForNonPreferredDisplay:](v5, v37);

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v34);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  if (self->_layoutConfiguration != *((_DWORD *)v4 + 25)) {
    goto LABEL_42;
  }
  primaryDisplayItem = self->_primaryDisplayItem;
  if ((unint64_t)primaryDisplayItem | *((void *)v4 + 13))
  {
    if (!-[SBPBDisplayItem isEqual:](primaryDisplayItem, "isEqual:")) {
      goto LABEL_42;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 148) & 2) == 0 || self->_secondaryDisplayItemRole != *((_DWORD *)v4 + 32)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 148) & 2) != 0)
  {
    goto LABEL_42;
  }
  secondaryDisplayItem = self->_secondaryDisplayItem;
  if ((unint64_t)secondaryDisplayItem | *((void *)v4 + 15)
    && !-[SBPBDisplayItem isEqual:](secondaryDisplayItem, "isEqual:")
    || self->_environment != *((_DWORD *)v4 + 24))
  {
    goto LABEL_42;
  }
  if (self->_hidden)
  {
    if (!*((unsigned char *)v4 + 144)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 144))
  {
LABEL_42:
    char v15 = 0;
    goto LABEL_43;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 148) & 1) == 0 || self->_centerDisplayItemRole != *((_DWORD *)v4 + 12)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 148))
  {
    goto LABEL_42;
  }
  centerDisplayItem = self->_centerDisplayItem;
  if ((unint64_t)centerDisplayItem | *((void *)v4 + 5)
    && !-[SBPBDisplayItem isEqual:](centerDisplayItem, "isEqual:"))
  {
    goto LABEL_42;
  }
  if (self->_centerConfiguration != *((_DWORD *)v4 + 8)) {
    goto LABEL_42;
  }
  if (self->_relativeWidth != *((double *)v4 + 3)) {
    goto LABEL_42;
  }
  if (self->_relativeHeight != *((double *)v4 + 2)) {
    goto LABEL_42;
  }
  primaryLayoutAttributes = self->_primaryLayoutAttributes;
  if ((unint64_t)primaryLayoutAttributes | *((void *)v4 + 14))
  {
    if (!-[SBPBDisplayItemLayoutAttributes isEqual:](primaryLayoutAttributes, "isEqual:")) {
      goto LABEL_42;
    }
  }
  secondaryLayoutAttributes = self->_secondaryLayoutAttributes;
  if ((unint64_t)secondaryLayoutAttributes | *((void *)v4 + 17))
  {
    if (!-[SBPBDisplayItemLayoutAttributes isEqual:](secondaryLayoutAttributes, "isEqual:")) {
      goto LABEL_42;
    }
  }
  centerLayoutAttributes = self->_centerLayoutAttributes;
  if ((unint64_t)centerLayoutAttributes | *((void *)v4 + 7))
  {
    if (!-[SBPBDisplayItemLayoutAttributes isEqual:](centerLayoutAttributes, "isEqual:")) {
      goto LABEL_42;
    }
  }
  displayItems = self->_displayItems;
  if ((unint64_t)displayItems | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](displayItems, "isEqual:")) {
      goto LABEL_42;
    }
  }
  displayItemLayoutAttributes = self->_displayItemLayoutAttributes;
  if ((unint64_t)displayItemLayoutAttributes | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](displayItemLayoutAttributes, "isEqual:")) {
      goto LABEL_42;
    }
  }
  if (self->_preferredDisplayOrdinal != *((void *)v4 + 1)) {
    goto LABEL_42;
  }
  continuousExposeIdentifier = self->_continuousExposeIdentifier;
  if ((unint64_t)continuousExposeIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](continuousExposeIdentifier, "isEqual:")) {
      goto LABEL_42;
    }
  }
  displayItemLayoutAttributesForNonPreferredDisplays = self->_displayItemLayoutAttributesForNonPreferredDisplays;
  if ((unint64_t)displayItemLayoutAttributesForNonPreferredDisplays | *((void *)v4 + 10)) {
    char v15 = -[NSMutableArray isEqual:](displayItemLayoutAttributesForNonPreferredDisplays, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_43:

  return v15;
}

- (unint64_t)hash
{
  uint64_t layoutConfiguration = self->_layoutConfiguration;
  unint64_t v35 = [(SBPBDisplayItem *)self->_primaryDisplayItem hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_secondaryDisplayItemRole;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SBPBDisplayItem *)self->_secondaryDisplayItem hash];
  uint64_t environment = self->_environment;
  BOOL hidden = self->_hidden;
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_centerDisplayItemRole;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(SBPBDisplayItem *)self->_centerDisplayItem hash];
  uint64_t centerConfiguration = self->_centerConfiguration;
  double relativeWidth = self->_relativeWidth;
  double v11 = -relativeWidth;
  if (relativeWidth >= 0.0) {
    double v11 = self->_relativeWidth;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  double v14 = fmod(v12, 1.84467441e19);
  unint64_t v15 = 2654435761u * (unint64_t)v14;
  unint64_t v16 = v15 + (unint64_t)v13;
  if (v13 <= 0.0) {
    unint64_t v16 = 2654435761u * (unint64_t)v14;
  }
  unint64_t v17 = v15 - (unint64_t)fabs(v13);
  if (v13 < 0.0) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = v16;
  }
  double relativeHeight = self->_relativeHeight;
  double v20 = -relativeHeight;
  if (relativeHeight >= 0.0) {
    double v20 = self->_relativeHeight;
  }
  long double v21 = floor(v20 + 0.5);
  double v22 = (v20 - v21) * 1.84467441e19;
  double v23 = fmod(v21, 1.84467441e19);
  unint64_t v24 = 2654435761u * (unint64_t)v23;
  unint64_t v25 = v24 + (unint64_t)v22;
  if (v22 <= 0.0) {
    unint64_t v25 = 2654435761u * (unint64_t)v23;
  }
  unint64_t v26 = v24 - (unint64_t)fabs(v22);
  if (v22 >= 0.0) {
    unint64_t v26 = v25;
  }
  uint64_t v27 = v36 ^ v3 ^ v4 ^ (2654435761 * layoutConfiguration) ^ (2654435761 * environment) ^ (2654435761 * hidden) ^ v26 ^ v7 ^ v8 ^ (2654435761 * centerConfiguration) ^ v18;
  unint64_t v28 = [(SBPBDisplayItemLayoutAttributes *)self->_primaryLayoutAttributes hash];
  unint64_t v29 = v28 ^ [(SBPBDisplayItemLayoutAttributes *)self->_secondaryLayoutAttributes hash];
  unint64_t v30 = v29 ^ [(SBPBDisplayItemLayoutAttributes *)self->_centerLayoutAttributes hash];
  uint64_t v31 = v30 ^ [(NSMutableArray *)self->_displayItems hash];
  uint64_t v32 = v31 ^ [(NSMutableArray *)self->_displayItemLayoutAttributes hash] ^ (2654435761
                                                                                  * self->_preferredDisplayOrdinal);
  NSUInteger v33 = v32 ^ [(NSString *)self->_continuousExposeIdentifier hash];
  return v27 ^ v33 ^ [(NSMutableArray *)self->_displayItemLayoutAttributesForNonPreferredDisplays hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = v3;
  if (a1)
  {
    *(_DWORD *)(a1 + 100) = v3[25];
    uint64_t v5 = *(void *)(a1 + 104);
    id v6 = (void *)*((void *)v4 + 13);
    if (v5)
    {
      if (v6) {
        -[SBPBDisplayItem mergeFrom:](v5, v6);
      }
    }
    else if (v6)
    {
      -[SBPBAppLayout setPrimaryDisplayItem:](a1, v6);
    }
    if ((*((unsigned char *)v4 + 148) & 2) != 0)
    {
      *(_DWORD *)(a1 + 128) = *((_DWORD *)v4 + 32);
      *(unsigned char *)(a1 + 148) |= 2u;
    }
    uint64_t v7 = *(void *)(a1 + 120);
    unint64_t v8 = (void *)*((void *)v4 + 15);
    if (v7)
    {
      if (v8) {
        -[SBPBDisplayItem mergeFrom:](v7, v8);
      }
    }
    else if (v8)
    {
      -[SBPBAppLayout setSecondaryDisplayItem:](a1, v8);
    }
    *(_DWORD *)(a1 + 96) = *((_DWORD *)v4 + 24);
    *(unsigned char *)(a1 + 144) = *((unsigned char *)v4 + 144);
    if (*((unsigned char *)v4 + 148))
    {
      *(_DWORD *)(a1 + 48) = *((_DWORD *)v4 + 12);
      *(unsigned char *)(a1 + 148) |= 1u;
    }
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = (void *)*((void *)v4 + 5);
    if (v9)
    {
      if (v10) {
        -[SBPBDisplayItem mergeFrom:](v9, v10);
      }
    }
    else if (v10)
    {
      -[SBPBAppLayout setCenterDisplayItem:](a1, v10);
    }
    *(_DWORD *)(a1 + 32) = *((_DWORD *)v4 + 8);
    *(void *)(a1 + 24) = *((void *)v4 + 3);
    *(void *)(a1 + 16) = *((void *)v4 + 2);
    uint64_t v11 = *(void *)(a1 + 112);
    long double v12 = (void *)*((void *)v4 + 14);
    if (v11)
    {
      if (v12) {
        -[SBPBDisplayItemLayoutAttributes mergeFrom:](v11, (uint64_t)v12);
      }
    }
    else if (v12)
    {
      -[SBPBAppLayout setPrimaryLayoutAttributes:](a1, v12);
    }
    uint64_t v13 = *(void *)(a1 + 136);
    double v14 = (void *)*((void *)v4 + 17);
    if (v13)
    {
      if (v14) {
        -[SBPBDisplayItemLayoutAttributes mergeFrom:](v13, (uint64_t)v14);
      }
    }
    else if (v14)
    {
      -[SBPBAppLayout setSecondaryLayoutAttributes:](a1, v14);
    }
    uint64_t v15 = *(void *)(a1 + 56);
    unint64_t v16 = (void *)*((void *)v4 + 7);
    if (v15)
    {
      if (v16) {
        -[SBPBDisplayItemLayoutAttributes mergeFrom:](v15, (uint64_t)v16);
      }
    }
    else if (v16)
    {
      -[SBPBAppLayout setCenterLayoutAttributes:](a1, v16);
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v17 = *((id *)v4 + 11);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v42;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v17);
          }
          -[SBPBAppLayout addDisplayItems:](a1, *(void **)(*((void *)&v41 + 1) + 8 * v21++));
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v19);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v22 = *((id *)v4 + 9);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v38;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(v22);
          }
          -[SBPBAppLayout addDisplayItemLayoutAttributes:](a1, *(void **)(*((void *)&v37 + 1) + 8 * v26++));
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v24);
    }

    *(void *)(a1 + 8) = *((void *)v4 + 1);
    uint64_t v27 = (void *)*((void *)v4 + 8);
    if (v27) {
      -[SBPBAppLayout setContinuousExposeIdentifier:](a1, v27);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v28 = *((id *)v4 + 10);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v34;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(v28);
          }
          -[SBPBAppLayout addDisplayItemLayoutAttributesForNonPreferredDisplay:](a1, *(void **)(*((void *)&v33 + 1) + 8 * v32++));
        }
        while (v30 != v32);
        uint64_t v30 = [v28 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v30);
    }
  }
}

- (uint64_t)layoutConfiguration
{
  if (result) {
    return *(unsigned int *)(result + 100);
  }
  return result;
}

- (uint64_t)setLayoutConfiguration:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 100) = a2;
  }
  return result;
}

- (uint64_t)primaryDisplayItem
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (uint64_t)secondaryDisplayItem
{
  if (result) {
    return *(void *)(result + 120);
  }
  return result;
}

- (uint64_t)environment
{
  if (result) {
    return *(unsigned int *)(result + 96);
  }
  return result;
}

- (uint64_t)setEnvironment:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 96) = a2;
  }
  return result;
}

- (BOOL)hidden
{
  if (result) {
    return *(unsigned char *)(result + 144) != 0;
  }
  return result;
}

- (uint64_t)setHidden:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 144) = a2;
  }
  return result;
}

- (uint64_t)centerDisplayItem
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)centerConfiguration
{
  if (result) {
    return *(unsigned int *)(result + 32);
  }
  return result;
}

- (uint64_t)setCenterConfiguration:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 32) = a2;
  }
  return result;
}

- (double)relativeWidth
{
  if (a1) {
    return *(double *)(a1 + 24);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setRelativeWidth:(uint64_t)result
{
  if (result) {
    *(double *)(result + 24) = a2;
  }
  return result;
}

- (double)relativeHeight
{
  if (a1) {
    return *(double *)(a1 + 16);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setRelativeHeight:(uint64_t)result
{
  if (result) {
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)primaryLayoutAttributes
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

- (uint64_t)secondaryLayoutAttributes
{
  if (result) {
    return *(void *)(result + 136);
  }
  return result;
}

- (uint64_t)centerLayoutAttributes
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)displayItems
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (void)setDisplayItems:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (uint64_t)displayItemLayoutAttributes
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (void)setDisplayItemLayoutAttributes:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (uint64_t)preferredDisplayOrdinal
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)setPreferredDisplayOrdinal:(uint64_t)result
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)continuousExposeIdentifier
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)displayItemLayoutAttributesForNonPreferredDisplays
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (void)setDisplayItemLayoutAttributesForNonPreferredDisplays:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_secondaryDisplayItem, 0);
  objc_storeStrong((id *)&self->_primaryLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_primaryDisplayItem, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_displayItemLayoutAttributesForNonPreferredDisplays, 0);
  objc_storeStrong((id *)&self->_displayItemLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_continuousExposeIdentifier, 0);
  objc_storeStrong((id *)&self->_centerLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_centerDisplayItem, 0);
}

@end