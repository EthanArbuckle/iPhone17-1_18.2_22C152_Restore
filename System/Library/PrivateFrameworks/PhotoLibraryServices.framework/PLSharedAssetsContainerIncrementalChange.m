@interface PLSharedAssetsContainerIncrementalChange
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChanges;
- (BOOL)hasChangesAffectingSharingComposition;
- (BOOL)hasNoOtherAssetChangesRequiringMomentGeneration;
- (BOOL)hasSharingChanges;
- (BOOL)hasSharingOrSuggestionChanges;
- (BOOL)hasSuggestionChanges;
- (BOOL)isEqual:(id)a3;
- (NSArray)highlightContainerChanges;
- (PLSharedAssetsContainerIncrementalChange)init;
- (PLSharedAssetsContainerIncrementalChange)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)collectionChangeType;
- (int64_t)sharingChange;
- (unint64_t)hash;
- (unsigned)mediaType;
- (unsigned)suggestionStateChange;
- (void)addHighlightContainerChange:(id)a3 sourceHighlightID:(id)a4 destinationHighlightID:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)mergeChangesFrom:(id)a3;
- (void)setCollectionChangeType:(int64_t)a3;
- (void)setHasNoOtherAssetChangesRequiringMomentGeneration:(BOOL)a3;
- (void)setHighlightContainerChanges:(id)a3;
- (void)setMediaType:(unsigned __int8)a3;
- (void)setSharingChange:(int64_t)a3;
- (void)setSuggestionStateChange:(unsigned __int8)a3;
@end

@implementation PLSharedAssetsContainerIncrementalChange

- (void).cxx_destruct
{
}

- (void)setHighlightContainerChanges:(id)a3
{
}

- (NSArray)highlightContainerChanges
{
  return self->_highlightContainerChanges;
}

- (void)setHasNoOtherAssetChangesRequiringMomentGeneration:(BOOL)a3
{
  self->_hasNoOtherAssetChangesRequiringMomentGeneration = a3;
}

- (BOOL)hasNoOtherAssetChangesRequiringMomentGeneration
{
  return self->_hasNoOtherAssetChangesRequiringMomentGeneration;
}

- (void)setMediaType:(unsigned __int8)a3
{
  self->_mediaType = a3;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setSuggestionStateChange:(unsigned __int8)a3
{
  self->_suggestionStateChange = a3;
}

- (unsigned)suggestionStateChange
{
  return self->_suggestionStateChange;
}

- (void)setSharingChange:(int64_t)a3
{
  self->_sharingChange = a3;
}

- (int64_t)sharingChange
{
  return self->_sharingChange;
}

- (void)setCollectionChangeType:(int64_t)a3
{
  self->_collectionChangeType = a3;
}

- (int64_t)collectionChangeType
{
  return self->_collectionChangeType;
}

- (void)mergeChangesFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 collectionChangeType]) {
      -[PLSharedAssetsContainerIncrementalChange setCollectionChangeType:](self, "setCollectionChangeType:", [v5 collectionChangeType]);
    }
    if ([v5 sharingChange])
    {
      if ([(PLSharedAssetsContainerIncrementalChange *)self sharingChange] == 1
        && [v5 sharingChange] == 2
        || [(PLSharedAssetsContainerIncrementalChange *)self sharingChange] == 2
        && [v5 sharingChange] == 1)
      {
        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v6 = [v5 sharingChange];
      }
      [(PLSharedAssetsContainerIncrementalChange *)self setSharingChange:v6];
    }
    if ([v5 suggestionStateChange])
    {
      if ([(PLSharedAssetsContainerIncrementalChange *)self suggestionStateChange] == 1
        && [v5 suggestionStateChange] == 2
        || [(PLSharedAssetsContainerIncrementalChange *)self suggestionStateChange] == 2
        && [v5 suggestionStateChange] == 1)
      {
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v7 = [v5 suggestionStateChange];
      }
      [(PLSharedAssetsContainerIncrementalChange *)self setSuggestionStateChange:v7];
    }
    -[PLSharedAssetsContainerIncrementalChange setMediaType:](self, "setMediaType:", [v5 mediaType]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = objc_msgSend(v5, "highlightContainerChanges", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
          v14 = [(PLSharedAssetsContainerIncrementalChange *)self highlightContainerChanges];
          char v15 = [v14 containsObject:v13];

          if ((v15 & 1) == 0)
          {
            v16 = [(PLSharedAssetsContainerIncrementalChange *)self highlightContainerChanges];
            id v17 = (id)[v16 arrayByAddingObject:v13];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
}

- (void)addHighlightContainerChange:(id)a3 sourceHighlightID:(id)a4 destinationHighlightID:(id)a5
{
  id v18 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  if (!v18)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLSharedAssetsContainer.m", 294, @"Invalid parameter not satisfying: %@", @"relationshipKey" object file lineNumber description];
  }
  if (!(v9 | v10))
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLSharedAssetsContainer.m", 295, @"Invalid parameter not satisfying: %@", @"sourceHighlightID != nil || destinationHighlightID != nil" object file lineNumber description];
  }
  uint64_t v11 = objc_alloc_init(PLSharedAssetsContainerIncrementalChangeHighlightContainerChange);
  [(PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *)v11 setRelationshipKey:v18];
  uint64_t v12 = [(id)v9 URIRepresentation];
  [(PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *)v11 setSourceHighlightURI:v12];

  uint64_t v13 = [(id)v10 URIRepresentation];
  [(PLSharedAssetsContainerIncrementalChangeHighlightContainerChange *)v11 setDestinationHighlightURI:v13];

  v14 = [(NSArray *)self->_highlightContainerChanges arrayByAddingObject:v11];
  highlightContainerChanges = self->_highlightContainerChanges;
  self->_highlightContainerChanges = v14;
}

- (BOOL)hasChangesAffectingSharingComposition
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if ([(PLSharedAssetsContainerIncrementalChange *)self hasSharingChanges])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v16[0] = @"highlightBeingAssets";
    v16[1] = @"dayGroupHighlightBeingAssets";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(PLSharedAssetsContainerIncrementalChange *)self highlightContainerChanges];
    uint64_t v3 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v5);
          }
          v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) relationshipKey];
          char v9 = [v4 containsObject:v8];

          if (v9)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (BOOL)hasChanges
{
  if ([(PLSharedAssetsContainerIncrementalChange *)self hasSharingOrSuggestionChanges]
    || self->_collectionChangeType)
  {
    return 1;
  }
  id v4 = [(PLSharedAssetsContainerIncrementalChange *)self highlightContainerChanges];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (BOOL)hasSuggestionChanges
{
  return [(PLSharedAssetsContainerIncrementalChange *)self suggestionStateChange] != 0;
}

- (BOOL)hasSharingOrSuggestionChanges
{
  return [(PLSharedAssetsContainerIncrementalChange *)self hasSharingChanges]
      || [(PLSharedAssetsContainerIncrementalChange *)self suggestionStateChange] != 0;
}

- (BOOL)hasSharingChanges
{
  if ([(PLSharedAssetsContainerIncrementalChange *)self collectionChangeType]) {
    return 0;
  }
  id v4 = [(PLSharedAssetsContainerIncrementalChange *)self highlightContainerChanges];
  if ([v4 count]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [(PLSharedAssetsContainerIncrementalChange *)self sharingChange] != 0;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setSharingChange:self->_sharingChange];
  [v4 setSuggestionStateChange:self->_suggestionStateChange];
  [v4 setMediaType:self->_mediaType];
  [v4 setCollectionChangeType:self->_collectionChangeType];
  v5 = (void *)[(NSArray *)self->_highlightContainerChanges copy];
  [v4 setHighlightContainerChanges:v5];

  [v4 setHasNoOtherAssetChangesRequiringMomentGeneration:self->_hasNoOtherAssetChangesRequiringMomentGeneration];
  return v4;
}

- (PLSharedAssetsContainerIncrementalChange)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLSharedAssetsContainerIncrementalChange;
  v2 = [(PLSharedAssetsContainerIncrementalChange *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_suggestionStateChange = 0;
    v2->_collectionChangeType = 0;
    v2->_sharingChange = 0;
    highlightContainerChanges = v2->_highlightContainerChanges;
    v2->_highlightContainerChanges = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_hasNoOtherAssetChangesRequiringMomentGeneration = 0;
  }
  return v3;
}

- (id)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(PLSharedAssetsContainerIncrementalChange *)self collectionChangeType];
  int64_t v6 = [(PLSharedAssetsContainerIncrementalChange *)self sharingChange];
  uint64_t v7 = [(PLSharedAssetsContainerIncrementalChange *)self suggestionStateChange];
  uint64_t v8 = [(PLSharedAssetsContainerIncrementalChange *)self mediaType];
  BOOL v9 = [(PLSharedAssetsContainerIncrementalChange *)self hasNoOtherAssetChangesRequiringMomentGeneration];
  unint64_t v10 = [(PLSharedAssetsContainerIncrementalChange *)self highlightContainerChanges];
  if ([v10 count])
  {
    long long v11 = [(PLSharedAssetsContainerIncrementalChange *)self highlightContainerChanges];
    uint64_t v12 = [v11 debugDescription];
    long long v13 = v3;
    long long v14 = (void *)v12;
    objc_msgSend(v13, "stringWithFormat:", @"<%@: %p; collectionChangeType = %d, sharingChange = %d, suggestionStateChange = %d, mediaType = %d, hasNoOtherAssetChangesRequiringMomentGeneration = %d, highlightContainerChanges = %@>",
      v4,
      self,
      v5,
      v6,
      v7,
      v8,
      v9,
    char v15 = v12);
  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; collectionChangeType = %d, sharingChange = %d, suggestionStateChange = %d, mediaType = %d, hasNoOtherAssetChangesRequiringMomentGeneration = %d, highlightContainerChanges = %@>",
      v4,
      self,
      v5,
      v6,
      v7,
      v8,
      v9,
    char v15 = &stru_1EEB2EB80);
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_sharingChange ^ self->_collectionChangeType ^ self->_suggestionStateChange ^ (unint64_t)self->_mediaType;
  BOOL hasNoOtherAssetChangesRequiringMomentGeneration = self->_hasNoOtherAssetChangesRequiringMomentGeneration;
  return v2 ^ hasNoOtherAssetChangesRequiringMomentGeneration ^ [(NSArray *)self->_highlightContainerChanges hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PLSharedAssetsContainerIncrementalChange *)a3;
  if (v4 == self)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      int64_t v6 = [(PLSharedAssetsContainerIncrementalChange *)self collectionChangeType];
      if (v6 == [(PLSharedAssetsContainerIncrementalChange *)v5 collectionChangeType]
        && (int64_t v7 = [(PLSharedAssetsContainerIncrementalChange *)self sharingChange],
            v7 == [(PLSharedAssetsContainerIncrementalChange *)v5 sharingChange])
        && (int v8 = [(PLSharedAssetsContainerIncrementalChange *)self suggestionStateChange],
            v8 == [(PLSharedAssetsContainerIncrementalChange *)v5 suggestionStateChange])
        && (int v9 = [(PLSharedAssetsContainerIncrementalChange *)self mediaType],
            v9 == [(PLSharedAssetsContainerIncrementalChange *)v5 mediaType])
        && (BOOL v10 = [(PLSharedAssetsContainerIncrementalChange *)self hasNoOtherAssetChangesRequiringMomentGeneration], v10 == [(PLSharedAssetsContainerIncrementalChange *)v5 hasNoOtherAssetChangesRequiringMomentGeneration]))
      {
        char IsEqual = PLObjectIsEqual();
      }
      else
      {
        char IsEqual = 0;
      }
    }
    else
    {
      char IsEqual = 0;
    }
  }

  return IsEqual;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[PLSharedAssetsContainerIncrementalChange collectionChangeType](self, "collectionChangeType"), @"collectionChangeType");
  objc_msgSend(v5, "encodeInteger:forKey:", -[PLSharedAssetsContainerIncrementalChange sharingChange](self, "sharingChange"), @"sharingChange");
  objc_msgSend(v5, "encodeInteger:forKey:", -[PLSharedAssetsContainerIncrementalChange suggestionStateChange](self, "suggestionStateChange"), @"suggestionStateChange");
  objc_msgSend(v5, "encodeInteger:forKey:", -[PLSharedAssetsContainerIncrementalChange mediaType](self, "mediaType"), @"mediaType");
  uint64_t v4 = [(PLSharedAssetsContainerIncrementalChange *)self highlightContainerChanges];
  [v5 encodeObject:v4 forKey:@"highlightContainerChanges"];

  objc_msgSend(v5, "encodeBool:forKey:", -[PLSharedAssetsContainerIncrementalChange hasNoOtherAssetChangesRequiringMomentGeneration](self, "hasNoOtherAssetChangesRequiringMomentGeneration"), @"hasNoOtherAssetChangesRequiringMomentGeneration");
}

- (PLSharedAssetsContainerIncrementalChange)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLSharedAssetsContainerIncrementalChange;
  id v5 = [(PLSharedAssetsContainerIncrementalChange *)&v11 init];
  if (v5)
  {
    v5->_collectionChangeType = [v4 decodeIntegerForKey:@"collectionChangeType"];
    v5->_sharingChange = [v4 decodeIntegerForKey:@"sharingChange"];
    v5->_suggestionStateChange = [v4 decodeIntegerForKey:@"suggestionStateChange"];
    v5->_mediaType = [v4 decodeIntegerForKey:@"mediaType"];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    int64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObjects:v12 count:2];
    for (uint64_t i = 1; i != -1; --i)

    uint64_t v8 = [v4 decodeObjectOfClasses:v6 forKey:@"highlightContainerChanges"];
    highlightContainerChanges = v5->_highlightContainerChanges;
    v5->_highlightContainerChanges = (NSArray *)v8;

    v5->_BOOL hasNoOtherAssetChangesRequiringMomentGeneration = [v4 decodeBoolForKey:@"hasNoOtherAssetChangesRequiringMomentGeneration"];
    if (!v5->_highlightContainerChanges) {
      v5->_highlightContainerChanges = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end