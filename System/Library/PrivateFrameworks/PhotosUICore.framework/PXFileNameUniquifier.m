@interface PXFileNameUniquifier
- (BOOL)_fileExistsAtPath:(id)a3;
- (NSArray)existingFileSources;
- (PXFileNameUniquifier)initWithExistingFileSources:(id)a3;
- (id)_uniqueFileSystemName:(id)a3 inDirectory:(id)a4 rememberResult:(BOOL)a5;
- (id)ensureUniqueFileURL:(id)a3;
- (id)ensureUniquePath:(id)a3;
- (id)ensureUniquePath:(id)a3 alternateExtensions:(id)a4;
- (id)ensureUniquePath:(id)a3 andAlternateExtension:(id)a4;
- (id)uniqueFileSystemName:(id)a3 inDirectory:(id)a4;
- (id)uniqueFileSystemNameForPath:(id)a3 withAlternateExtension:(id)a4;
- (id)uniqueFileSystemNameForPath:(id)a3 withAlternateExtensions:(id)a4;
- (void)_rememberUniquifiedPath:(id)a3;
@end

@implementation PXFileNameUniquifier

- (void).cxx_destruct
{
}

- (NSArray)existingFileSources
{
  return self->_existingFileSources;
}

- (void)_rememberUniquifiedPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(PXFileNameUniquifier *)self existingFileSources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) rememberUniquifiedFilePath:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)_fileExistsAtPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(PXFileNameUniquifier *)self existingFileSources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) fileExistsAtPath:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)ensureUniqueFileURL:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [a3 path];
  uint64_t v6 = [(PXFileNameUniquifier *)self ensureUniquePath:v5];
  uint64_t v7 = [v4 fileURLWithPath:v6];

  return v7;
}

- (id)ensureUniquePath:(id)a3 alternateExtensions:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1AD10CB00]();
  id v8 = a3;
  uint64_t v9 = [v8 stringByExpandingTildeInPath];
  long long v10 = [v9 stringByDeletingLastPathComponent];

  long long v11 = [(PXFileNameUniquifier *)self uniqueFileSystemNameForPath:v8 withAlternateExtensions:v6];

  long long v12 = [v10 stringByAppendingPathComponent:v11];

  return v12;
}

- (id)ensureUniquePath:(id)a3 andAlternateExtension:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1AD10CB00]();
  id v8 = a3;
  uint64_t v9 = [v8 stringByExpandingTildeInPath];
  long long v10 = [v9 stringByDeletingLastPathComponent];

  long long v11 = [(PXFileNameUniquifier *)self uniqueFileSystemNameForPath:v8 withAlternateExtension:v6];

  long long v12 = [v10 stringByAppendingPathComponent:v11];

  return v12;
}

- (id)ensureUniquePath:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringByExpandingTildeInPath];
  BOOL v6 = [(PXFileNameUniquifier *)self _fileExistsAtPath:v5];

  uint64_t v7 = v4;
  if (v6)
  {
    id v8 = [v4 stringByExpandingTildeInPath];
    uint64_t v9 = [v8 stringByDeletingLastPathComponent];

    long long v10 = [v4 lastPathComponent];
    long long v11 = [(PXFileNameUniquifier *)self _uniqueFileSystemName:v10 inDirectory:v9 rememberResult:0];

    uint64_t v7 = [v9 stringByAppendingPathComponent:v11];
  }
  [(PXFileNameUniquifier *)self _rememberUniquifiedPath:v7];

  return v7;
}

- (id)uniqueFileSystemNameForPath:(id)a3 withAlternateExtensions:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x1AD10CB00]();
  v58 = [v6 lastPathComponent];
  id v8 = [v58 stringByDeletingPathExtension];
  uint64_t v9 = [v6 pathExtension];
  v61 = v6;
  long long v10 = [v6 stringByDeletingLastPathComponent];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obuint64_t j = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v86 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = [*(id *)(*((void *)&v85 + 1) + 8 * i) lowercaseString];
        [v11 addObject:v16];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v85 objects:v93 count:16];
    }
    while (v13);
  }

  v17 = [v9 lowercaseString];
  char v18 = [v11 containsObject:v17];

  if ((v18 & 1) == 0)
  {
    v19 = [v9 lowercaseString];
    [v11 addObject:v19];
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v21 = v11;
  v22 = v20;
  id v23 = v21;
  uint64_t v24 = [v21 countByEnumeratingWithState:&v81 objects:v92 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v82;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v82 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [v8 stringByAppendingPathExtension:*(void *)(*((void *)&v81 + 1) + 8 * j)];
        [v22 addObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v81 objects:v92 count:16];
    }
    while (v25);
  }
  v62 = v9;
  v59 = v8;
  v65 = v23;

  v29 = 0;
  for (id k = v22; ; v22 = k)
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v30 = v22;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v77 objects:v91 count:16];
    if (v31) {
      break;
    }
    id v33 = 0;
LABEL_29:

    v67 = [(PXFileNameUniquifier *)self _uniqueFileSystemName:v33 inDirectory:v10 rememberResult:0];
    v39 = [v67 stringByDeletingPathExtension];

    [v30 removeAllObjects];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v40 = v65;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v73 objects:v90 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v74;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v74 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [v39 stringByAppendingPathExtension:*(void *)(*((void *)&v73 + 1) + 8 * m)];
          [v30 addObject:v45];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v73 objects:v90 count:16];
      }
      while (v42);
    }

    v29 = v39;
  }
  uint64_t v32 = v31;
  v66 = v29;
  id v33 = 0;
  uint64_t v34 = *(void *)v78;
  do
  {
    uint64_t v35 = 0;
    v36 = v33;
    do
    {
      if (*(void *)v78 != v34) {
        objc_enumerationMutation(v30);
      }
      id v33 = *(id *)(*((void *)&v77 + 1) + 8 * v35);

      v37 = [v10 stringByAppendingPathComponent:v33];
      BOOL v38 = [(PXFileNameUniquifier *)self _fileExistsAtPath:v37];

      if (v38)
      {
        v29 = v66;
        goto LABEL_29;
      }
      ++v35;
      v36 = v33;
    }
    while (v32 != v35);
    uint64_t v32 = [v30 countByEnumeratingWithState:&v77 objects:v91 count:16];
  }
  while (v32);

  v46 = [v30 anyObject];
  v47 = [v46 stringByDeletingPathExtension];
  v48 = [v47 stringByAppendingPathExtension:v62];

  id v64 = v48;
  v49 = [v48 stringByDeletingPathExtension];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v50 = v65;
  uint64_t v51 = [v50 countByEnumeratingWithState:&v69 objects:v89 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v70;
    do
    {
      for (uint64_t n = 0; n != v52; ++n)
      {
        if (*(void *)v70 != v53) {
          objc_enumerationMutation(v50);
        }
        v55 = [v49 stringByAppendingPathExtension:*(void *)(*((void *)&v69 + 1) + 8 * n)];
        v56 = [v10 stringByAppendingPathComponent:v55];

        [(PXFileNameUniquifier *)self _rememberUniquifiedPath:v56];
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v69 objects:v89 count:16];
    }
    while (v52);
  }

  return v64;
}

- (id)uniqueFileSystemNameForPath:(id)a3 withAlternateExtension:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  id v8 = [v6 setWithObject:a4];
  uint64_t v9 = [(PXFileNameUniquifier *)self uniqueFileSystemNameForPath:v7 withAlternateExtensions:v8];

  return v9;
}

- (id)_uniqueFileSystemName:(id)a3 inDirectory:(id)a4 rememberResult:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v10 = v9;
  if (!v8 || !v9) {
    goto LABEL_25;
  }
  uint64_t v11 = MEMORY[0x1AD10CB00]();
  v55 = [v8 pathExtension];
  uint64_t v12 = [v55 length];
  id v13 = v8;
  uint64_t v14 = (void *)[[NSString alloc] initWithString:@"1"];
  uint64_t v15 = [v10 stringByAppendingPathComponent:v13];
  if (v12)
  {
    uint64_t v16 = [v13 stringByDeletingPathExtension];
LABEL_5:
    v54 = (void *)v16;

    goto LABEL_6;
  }
  v54 = v13;
  if ([v13 length])
  {
    v54 = v13;
    if (objc_msgSend(v13, "characterAtIndex:", objc_msgSend(v13, "length") - 1) == 46)
    {
      uint64_t v16 = objc_msgSend(v13, "substringToIndex:", objc_msgSend(v13, "length") - 1);
      goto LABEL_5;
    }
  }
LABEL_6:
  uint64_t v53 = v13;
  v58 = self;
  context = (void *)v11;
  BOOL v51 = v5;
  if ([(PXFileNameUniquifier *)self _fileExistsAtPath:v15])
  {
    uint64_t v17 = [v54 length];
    int v18 = objc_msgSend(@""), "characterAtIndex:", 0);
    uint64_t v56 = v17;
    uint64_t v19 = v17 - 1;
    if (v18 == [v54 characterAtIndex:v19])
    {
      uint64_t v20 = objc_msgSend(v54, "rangeOfString:options:", @" ("), 4;
      uint64_t v22 = v21;
      unint64_t v23 = objc_msgSend(v54, "rangeOfString:options:", @""), 4);
      if (v23 != 0x7FFFFFFFFFFFFFFFLL && v20 && v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v42 = v19;
        unint64_t v43 = v20 + v22;
        unint64_t v49 = v43;
        unint64_t v50 = v23;
        if (v23 <= v43) {
          unint64_t v44 = v43;
        }
        else {
          unint64_t v44 = v23;
        }
        while (v44 != v43)
        {
          uint64_t v45 = [v54 characterAtIndex:v43];
          v46 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
          LOBYTE(v45) = [v46 characterIsMember:v45];

          ++v43;
          if ((v45 & 1) == 0) {
            goto LABEL_42;
          }
        }
        if (v50 >= v49 && v44 == v42)
        {
          uint64_t v47 = [v53 substringToIndex:v20];

          v54 = (void *)v47;
        }
        else
        {
          v48 = PLUIGetLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218496;
            unint64_t v60 = v44;
            __int16 v61 = 2048;
            uint64_t v62 = v56;
            __int16 v63 = 2048;
            unint64_t v64 = v50;
            _os_log_impl(&dword_1A9AE7000, v48, OS_LOG_TYPE_ERROR, "File name uniquifier unexpected index for end of string: %lu, length: %lu; right index: %lu",
              buf,
              0x20u);
          }
        }
LABEL_42:
        self = v58;
      }
    }
  }
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @" (%lu)", 1);
  BOOL v25 = [(PXFileNameUniquifier *)self _fileExistsAtPath:v15];
  v57 = v10;
  if (v12)
  {
    if (v25)
    {
      uint64_t v26 = 1;
      do
      {
        v27 = [v54 stringByAppendingString:v24];
        v28 = [v27 stringByAppendingPathExtension:v55];

        v29 = [v10 stringByAppendingPathComponent:v28];

        uint64_t v30 = [v24 rangeOfString:v14];
        uint64_t v32 = v31;
        id v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", v26);

        uint64_t v34 = v32;
        self = v58;
        objc_msgSend(v24, "replaceCharactersInRange:withString:", v30, v34, v33);

        ++v26;
        long long v10 = v57;
        uint64_t v14 = v33;
        uint64_t v15 = v29;
      }
      while ([(PXFileNameUniquifier *)v58 _fileExistsAtPath:v29]);
      goto LABEL_22;
    }
  }
  else if (v25)
  {
    uint64_t v35 = 1;
    do
    {
      v36 = [v54 stringByAppendingString:v24];
      v29 = [v10 stringByAppendingPathComponent:v36];

      uint64_t v37 = [v24 rangeOfString:v14];
      uint64_t v39 = v38;
      id v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", v35);

      uint64_t v40 = v37;
      self = v58;
      objc_msgSend(v24, "replaceCharactersInRange:withString:", v40, v39, v33);

      ++v35;
      long long v10 = v57;
      uint64_t v14 = v33;
      uint64_t v15 = v29;
    }
    while ([(PXFileNameUniquifier *)v58 _fileExistsAtPath:v29]);
    goto LABEL_22;
  }
  id v33 = v14;
  v29 = v15;
LABEL_22:

  if (v51) {
    [(PXFileNameUniquifier *)self _rememberUniquifiedPath:v29];
  }
  id v8 = [v29 lastPathComponent];

LABEL_25:

  return v8;
}

- (id)uniqueFileSystemName:(id)a3 inDirectory:(id)a4
{
  return [(PXFileNameUniquifier *)self _uniqueFileSystemName:a3 inDirectory:a4 rememberResult:1];
}

- (PXFileNameUniquifier)initWithExistingFileSources:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXFileNameUniquifier.m", 26, @"Invalid parameter not satisfying: %@", @"sources.count" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXFileNameUniquifier;
  id v6 = [(PXFileNameUniquifier *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    existingFileSources = v6->_existingFileSources;
    v6->_existingFileSources = (NSArray *)v7;
  }
  return v6;
}

@end