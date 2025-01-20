@interface BRFieldXattrBlob
+ (BOOL)loadXattrsFromFD:(int)a3 structuralBlob:(id *)a4 contentBlob:(id *)a5 localBlob:(id *)a6 withMaximumSize:(unint64_t)a7 error:(id *)a8;
+ (BOOL)loadXattrsFromURL:(id)a3 structuralBlob:(id *)a4 contentBlob:(id *)a5 localBlob:(id *)a6 withMaximumSize:(unint64_t)a7 error:(id *)a8;
+ (BOOL)removeXattrsOnFD:(int)a3 includingContentRelated:(BOOL)a4 error:(id *)a5;
+ (Class)xattrsType;
+ (id)loadXattrsFromFD:(int)a3 withMaximumSize:(unint64_t)a4 error:(id *)a5;
+ (void)loadXattrsFromDictionary:(id)a3 structuralBlob:(id *)a4 contentBlob:(id *)a5;
- (BOOL)applyToFileDescriptor:(int)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)xattrs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)shortDescription;
- (id)xattrsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)xattrsCount;
- (void)addXattrs:(id)a3;
- (void)clearXattrs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setXattrs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BRFieldXattrBlob

+ (void)loadXattrsFromDictionary:(id)a3 structuralBlob:(id *)a4 contentBlob:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    v27 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v23 = a5;
      v24 = a4;
      id v25 = v7;
      v26 = 0;
      id v28 = 0;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqualToString:", @"com.apple.fpfs.fileid", v23) & 1) == 0
            && ([v13 isEqualToString:@"com.apple.clouddocs.private.share-bookmark#B"] & 1) == 0
            && ([v13 isEqualToString:@"com.apple.clouddocs.private.trash-parent-bookmark#B"] & 1) == 0
            && ([v13 isEqualToString:@"com.apple.finder.copy.preserveinbackups.com.apple.clouddocs.private.share-bookmark#N"] & 1) == 0&& (objc_msgSend(v13, "isEqualToString:", @"com.apple.finder.copy.preserveinbackups.com.apple.clouddocs.private.trash-parent-bookmark#N") & 1) == 0&& (objc_msgSend(v13, "isEqualToString:", @"com.apple.fileprovider.trash-put-back#PN") & 1) == 0)
          {
            [v27 setName:v13];
            v14 = [v8 objectForKeyedSubscript:v13];
            [v27 setValue:v14];

            id v15 = objc_alloc_init(MEMORY[0x263F62230]);
            [v27 writeTo:v15];
            if ((brc_xattr_flags_from_name((char *)[v13 cStringUsingEncoding:4]) & 2) != 0)
            {
              if (!v28) {
                id v28 = objc_alloc_init(MEMORY[0x263F62230]);
              }
              v17 = [v15 data];
              v18 = v28;
            }
            else
            {
              id v16 = v26;
              if (!v26) {
                id v16 = objc_alloc_init(MEMORY[0x263F62230]);
              }
              v17 = [v15 data];
              v26 = v16;
              v18 = v16;
            }
            [v18 writeData:v17 forTag:1];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v10);

      if (v28)
      {
        uint64_t v19 = [v28 data];
        id v20 = *v23;
        id *v23 = (id)v19;
      }
      id v7 = v25;
      v21 = v26;
      if (!v26) {
        goto LABEL_29;
      }
      uint64_t v22 = [v26 data];
      id v8 = *v24;
      id *v24 = (id)v22;
    }
    else
    {
      id v28 = 0;
      v21 = 0;
    }

LABEL_29:
  }
}

+ (id)loadXattrsFromFD:(int)a3 withMaximumSize:(unint64_t)a4 error:(id *)a5
{
  id v8 = [[BRCLazyXattrsCollection alloc] initWithFD:*(void *)&a3 sizeLimit:a4 syncable:1 error:a5];
  uint64_t v9 = v8;
  if (v8 && [(BRCLazyXattrsCollection *)v8 xattrNamesCount])
  {
    id v10 = objc_alloc_init(MEMORY[0x263F62230]);
    uint64_t v11 = v9;
    if (brc_pack_xattrs(a3, v10, a4, (uint64_t)[(BRCLazyXattrsCollection *)v11 xattrNamesBegin], [(BRCLazyXattrsCollection *)v11 xattrNamesCount], a5))
    {
      v12 = [v10 data];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)loadXattrsFromURL:(id)a3 structuralBlob:(id *)a4 contentBlob:(id *)a5 localBlob:(id *)a6 withMaximumSize:(unint64_t)a7 error:(id *)a8
{
  id v14 = a3;
  uint64_t v15 = openat(-1, (const char *)[v14 fileSystemRepresentation], 33028, 0);
  if ((v15 & 0x80000000) != 0)
  {
    v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
      +[BRFieldXattrBlob(BRCStageAdditions) loadXattrsFromURL:structuralBlob:contentBlob:localBlob:withMaximumSize:error:](v14, (uint64_t)v18, v19);
    }

    if (a8)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
      char v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    int v16 = v15;
    char v17 = [a1 loadXattrsFromFD:v15 structuralBlob:a4 contentBlob:a5 localBlob:a6 withMaximumSize:a7 error:a8];
    close(v16);
  }

  return v17;
}

+ (BOOL)loadXattrsFromFD:(int)a3 structuralBlob:(id *)a4 contentBlob:(id *)a5 localBlob:(id *)a6 withMaximumSize:(unint64_t)a7 error:(id *)a8
{
  id v14 = [[BRCLazyXattrsCollection alloc] initWithFD:*(void *)&a3 sizeLimit:a7 syncable:1 error:a8];
  uint64_t v15 = v14;
  if (!v14)
  {
    id v17 = 0;
    goto LABEL_13;
  }
  unsigned int v16 = [(BRCLazyXattrsCollection *)v14 structuralXattrNamesCount];
  id v17 = 0;
  if (!a4 || !v16) {
    goto LABEL_6;
  }
  id v17 = objc_alloc_init(MEMORY[0x263F62230]);
  v18 = v15;
  if (!brc_pack_xattrs(a3, v17, a7, (uint64_t)[(BRCLazyXattrsCollection *)v18 structuralXattrNamesBegin], [(BRCLazyXattrsCollection *)v18 structuralXattrNamesCount], a8))
  {
LABEL_13:
    BOOL v26 = 0;
    goto LABEL_14;
  }
  uint64_t v19 = [v17 data];
  id v20 = *a4;
  *a4 = v19;

LABEL_6:
  unsigned int v21 = [(BRCLazyXattrsCollection *)v15 contentXattrNamesCount];
  if (a5 && v21)
  {
    id v22 = objc_alloc_init(MEMORY[0x263F62230]);

    v23 = v15;
    if (!brc_pack_xattrs(a3, v22, a7, (uint64_t)[(BRCLazyXattrsCollection *)v23 contentXattrNamesBegin], [(BRCLazyXattrsCollection *)v23 contentXattrNamesCount], a8))
    {
      BOOL v26 = 0;
      id v17 = v22;
      goto LABEL_14;
    }
    v24 = [v22 data];
    id v25 = *a5;
    *a5 = v24;

    id v17 = v22;
  }
  if (a6)
  {
    id v28 = brc_bread_crumbs();
    long long v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      +[BRFieldXattrBlob(BRCStageAdditions) loadXattrsFromFD:structuralBlob:contentBlob:localBlob:withMaximumSize:error:]((uint64_t)v28, v29);
    }
  }
  BOOL v26 = 1;
LABEL_14:

  return v26;
}

+ (BOOL)removeXattrsOnFD:(int)a3 includingContentRelated:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v7 = [[BRCLazyXattrsCollection alloc] initWithFD:*(void *)&a3 sizeLimit:-1 syncable:1 error:a5];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = v7;
    id v10 = v9;
    if (v5)
    {
      uint64_t v11 = [(BRCLazyXattrsCollection *)v9 xattrNamesBegin];
      unsigned int v12 = [(BRCLazyXattrsCollection *)v10 xattrNamesCount];
    }
    else
    {
      uint64_t v11 = [(BRCLazyXattrsCollection *)v9 structuralXattrNamesBegin];
      unsigned int v12 = [(BRCLazyXattrsCollection *)v10 structuralXattrNamesCount];
    }
    brc_remove_xattrs(a3, v11, v12);
  }

  return v8 != 0;
}

- (BOOL)applyToFileDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v6 = self->_xattrs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v25 = a4;
    uint64_t v9 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        unsigned int v12 = [v11 value];
        id v13 = [v11 name];
        id v14 = (const char *)[v13 fileSystemRepresentation];

        uint64_t v15 = brc_bread_crumbs();
        unsigned int v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = [v12 length];
          *(_DWORD *)buf = 136315650;
          long long v31 = v14;
          __int16 v32 = 2048;
          uint64_t v33 = v18;
          __int16 v34 = 2112;
          v35 = v15;
          _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] added xattr %s (%lld bytes)%@", buf, 0x20u);
        }

        id v17 = v12;
        if (fsetxattr(a3, v14, (const void *)[v17 bytes], objc_msgSend(v17, "length"), 0, 0) < 0)
        {
          id v20 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
          if (v20)
          {
            unsigned int v21 = brc_bread_crumbs();
            id v22 = brc_default_log();
            if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
            {
              v24 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              long long v31 = "-[BRFieldXattrBlob(BRCStageAdditions) applyToFileDescriptor:error:]";
              __int16 v32 = 2080;
              if (!v25) {
                v24 = "(ignored by caller)";
              }
              uint64_t v33 = (uint64_t)v24;
              __int16 v34 = 2112;
              v35 = v20;
              __int16 v36 = 2112;
              v37 = v21;
              _os_log_error_impl(&dword_23FA42000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }
          }
          if (v25) {
            *id v25 = v20;
          }

          BOOL v19 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_18:

  return v19;
}

- (id)shortDescription
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = (void *)[@"{" mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = self->_xattrs;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    uint64_t v8 = "";
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((unint64_t)[v3 length] >= 0x21)
        {
          [v3 appendString:@", ..."];
          goto LABEL_13;
        }
        uint64_t v11 = [v10 name];
        uint64_t v12 = [v11 length];
        unint64_t v13 = [v3 length] + v12;

        if (v13 >= 0x21)
        {
          uint64_t v15 = 32 - [v3 length];
          unsigned int v16 = [v10 name];
          id v17 = [v16 substringToIndex:v15];
          [v3 appendFormat:@"%s%@...", v8, v17, (void)v19];

          goto LABEL_13;
        }
        id v14 = [v10 name];
        [v3 appendFormat:@"%s%@", v8, v14, (void)v19];

        uint64_t v8 = ", ";
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v8 = ", ";
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  [v3 appendString:@"}"];
  return v3;
}

- (void)clearXattrs
{
}

- (void)addXattrs:(id)a3
{
  id v4 = a3;
  xattrs = self->_xattrs;
  id v8 = v4;
  if (!xattrs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_xattrs;
    self->_xattrs = v6;

    id v4 = v8;
    xattrs = self->_xattrs;
  }
  [(NSMutableArray *)xattrs addObject:v4];
}

- (unint64_t)xattrsCount
{
  return [(NSMutableArray *)self->_xattrs count];
}

- (id)xattrsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_xattrs objectAtIndex:a3];
}

+ (Class)xattrsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRFieldXattrBlob;
  id v4 = [(BRFieldXattrBlob *)&v8 description];
  uint64_t v5 = [(BRFieldXattrBlob *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_xattrs count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_xattrs, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = self->_xattrs;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"xattrs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldXattrBlobReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_xattrs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(BRFieldXattrBlob *)self xattrsCount])
  {
    [v8 clearXattrs];
    unint64_t v4 = [(BRFieldXattrBlob *)self xattrsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BRFieldXattrBlob *)self xattrsAtIndex:i];
        [v8 addXattrs:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_xattrs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addXattrs:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    xattrs = self->_xattrs;
    if ((unint64_t)xattrs | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](xattrs, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_xattrs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[BRFieldXattrBlob addXattrs:](self, "addXattrs:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)xattrs
{
  return self->_xattrs;
}

- (void)setXattrs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end