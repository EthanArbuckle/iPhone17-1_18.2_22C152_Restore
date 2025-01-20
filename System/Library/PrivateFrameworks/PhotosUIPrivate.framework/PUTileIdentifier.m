@interface PUTileIdentifier
- (BOOL)isEqual:(id)a3;
- (NSIndexPath)indexPath;
- (NSString)dataSourceIdentifier;
- (NSString)tileKind;
- (PUTileIdentifier)initWithIndexPath:(id)a3 tileKind:(id)a4 dataSourceIdentifier:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation PUTileIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_tileKind, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (NSString)tileKind
{
  return self->_tileKind;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PUTileIdentifier *)self indexPath];
  v7 = objc_msgSend(v6, "pu_shortDescription");
  v8 = [(PUTileIdentifier *)self tileKind];
  v9 = [(PUTileIdentifier *)self dataSourceIdentifier];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; indexPath: %@; tileKind: %@; dataSourceIdentifier: %@>",
    v5,
    self,
    v7,
    v8,
  v10 = v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = [v4 hash];
  BOOL v6 = v5 == [(PUTileIdentifier *)self hash]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(NSIndexPath *)self->_indexPath isEqual:v4[2]]
    && [(NSString *)self->_tileKind isEqualToString:v4[3]]
    && [(NSString *)self->_dataSourceIdentifier isEqualToString:v4[4]];

  return v6;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (PUTileIdentifier)initWithIndexPath:(id)a3 tileKind:(id)a4 dataSourceIdentifier:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUTileLayoutInfo.m", 28, @"Invalid parameter not satisfying: %@", @"tileKind != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PUTileLayoutInfo.m", 27, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PUTileLayoutInfo.m", 29, @"Invalid parameter not satisfying: %@", @"dataSourceIdentifier != nil" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)PUTileIdentifier;
  v13 = [(PUTileIdentifier *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_indexPath, a3);
    objc_storeStrong((id *)&v14->_tileKind, a4);
    objc_storeStrong((id *)&v14->_dataSourceIdentifier, a5);
    uint64_t v15 = [v12 hash];
    uint64_t v16 = [v11 hash] - v15 + 32 * v15;
    v14->_hash = [v10 hash] - v16 + 32 * v16 + 29791;
  }

  return v14;
}

@end