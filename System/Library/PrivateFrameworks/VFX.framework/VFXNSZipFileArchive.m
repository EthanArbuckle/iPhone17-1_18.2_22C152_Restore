@interface VFXNSZipFileArchive
- (BOOL)isValid;
- (BOOL)writeContentsForEntryName:(id)a3 toFile:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (VFXNSZipFileArchive)initWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (VFXNSZipFileArchive)initWithEntryNames:(id)a3 contents:(id)a4 properties:(id)a5 options:(unint64_t)a6;
- (VFXNSZipFileArchive)initWithEntryNames:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5;
- (VFXNSZipFileArchive)initWithPath:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)archiveData;
- (id)archiveStream;
- (id)contentsForEntryName:(id)a3;
- (id)entryNames;
- (id)propertiesForEntryName:(id)a3;
- (id)streamForEntryName:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation VFXNSZipFileArchive

- (VFXNSZipFileArchive)initWithPath:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v19.receiver = self;
  v19.super_class = (Class)VFXNSZipFileArchive;
  v8 = [(VFXNSZipFileArchive *)&v19 init];
  uint64_t v12 = (uint64_t)v8;
  if (!a3 || !v8)
  {
    if (!v8) {
      return (VFXNSZipFileArchive *)v12;
    }
    goto LABEL_10;
  }
  if (!objc_msgSend_length(a3, v9, v10, v11)) {
    goto LABEL_10;
  }
  unint64_t v13 = a4 & 3;
  if (v13 != 1)
  {
    if (v13 == 2)
    {
      uint64_t v18 = objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x1E4F1C9B8], v9, (uint64_t)a3, 1, a5);
    }
    else
    {
      if (v13 == 3)
      {
        uint64_t v14 = sub_1B6532A48(a3, v9, v10, v11);
        if ((v14 & 0x8000000000000000) == 0)
        {
          int v15 = v14;
          *(void *)(v12 + 40) = objc_msgSend_copy(a3, v9, v10, v11);
          close(v15);
          goto LABEL_18;
        }
LABEL_10:
        objc_msgSend_dealloc((void *)v12, v9, v10, v11);
        return 0;
      }
      uint64_t v18 = objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x1E4F1C9B8], v9, (uint64_t)a3, 0, a5);
    }
    if (v18)
    {
      uint64_t v12 = objc_msgSend_initWithData_options_error_((void *)v12, v9, v18, a4, a5);
      if (!v12) {
        return (VFXNSZipFileArchive *)v12;
      }
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  uint64_t v17 = sub_1B6532A48(a3, v9, v10, v11);
  *(void *)(v12 + 32) = v17;
  if (v17 < 0) {
    goto LABEL_10;
  }
  *(_DWORD *)(v12 + 80) |= 0x10u;
LABEL_18:
  if ((a4 & 4) != 0) {
    *(_DWORD *)(v12 + 80) |= 8u;
  }
  return (VFXNSZipFileArchive *)v12;
}

- (VFXNSZipFileArchive)initWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v5 = a4;
  v100.receiver = self;
  v100.super_class = (Class)VFXNSZipFileArchive;
  v7 = [(VFXNSZipFileArchive *)&v100 init];
  uint64_t v11 = v7;
  if (!a3 || !v7) {
    goto LABEL_80;
  }
  v90 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
  v89 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13, v14);
  uint64_t v18 = objc_msgSend_bytes(a3, v15, v16, v17);
  unint64_t v22 = objc_msgSend_length(a3, v19, v20, v21);
  if (v22 < 0x15) {
    goto LABEL_81;
  }
  unint64_t v23 = v22;
  v8 = 0;
  unint64_t v24 = 0;
  uint64_t v25 = -20;
  unint64_t v26 = 20;
  uint64_t v27 = v18;
  do
  {
    int v28 = *(_DWORD *)(v27 + v22 - 20);
    if (v28 == 117853008)
    {
      unint64_t v29 = 0;
      if (v22 >= 0x39)
      {
        unint64_t v30 = *(void *)(v27 + v22 - 12);
        if (v30 <= v22 - 56)
        {
          unint64_t v31 = v18 + v30;
          if (*(_DWORD *)(v18 + v30) == 101075792)
          {
            v8 = *(const char **)(v31 + 24);
            unint64_t v24 = *(void *)(v31 + 48);
            unint64_t v29 = *(void *)(v27 + v22 - 12);
          }
          else
          {
            unint64_t v29 = 0;
          }
        }
      }
    }
    else if (v28 == 101010256)
    {
      unint64_t v29 = v22 - v26;
      v8 = (const char *)*(unsigned __int16 *)(v27 + v22 - 12);
      unint64_t v24 = *(unsigned int *)(v27 + v22 - 4);
    }
    else
    {
      unint64_t v29 = 0;
      if (v26 >= 0x38 && v28 == 101075792)
      {
        unint64_t v29 = v22 + v25;
        v8 = *(const char **)(v27 + v22 + 4);
        unint64_t v24 = *(void *)(v27 + v22 + 28);
      }
    }
    if (v26 > 0x101CE) {
      break;
    }
    if (v29) {
      break;
    }
    ++v26;
    --v25;
    --v27;
  }
  while (v26 < v22);
  if (!v8) {
    goto LABEL_80;
  }
  id v84 = a3;
  char v85 = v5;
  char v91 = 0;
  v32 = 0;
  uint64_t v88 = v18 + 8;
  v86 = v11;
  uint64_t v87 = v18 + 16;
  unint64_t v33 = v24;
  uint64_t v98 = v18;
  do
  {
    if (v33 < v24) {
      break;
    }
    if (v33 >= v23) {
      break;
    }
    unint64_t v34 = v33 + 46;
    if (v33 + 46 <= v24) {
      break;
    }
    if (v34 > v23) {
      break;
    }
    unint64_t v35 = v18 + v33;
    if (*(_DWORD *)v35 != 33639248) {
      break;
    }
    v97 = v8;
    uint64_t v37 = *(unsigned int *)(v35 + 20);
    uint64_t v36 = *(unsigned int *)(v35 + 24);
    uint64_t v38 = *(unsigned __int16 *)(v35 + 28);
    unint64_t v39 = *(unsigned int *)(v35 + 42);
    BOOL v40 = v37 == 0xFFFFFFFFLL || v36 == 0xFFFFFFFFLL;
    BOOL v41 = v40 || v39 == 0xFFFFFFFF;
    BOOL v42 = v41;
    unint64_t v43 = v34 + v38;
    if (v34 + v38 <= v24 || v43 > v23) {
      break;
    }
    id v44 = 0;
    uint64_t v9 = *(unsigned __int16 *)(v35 + 10);
    uint64_t v45 = *(unsigned __int16 *)(v35 + 30);
    uint64_t v95 = *(unsigned int *)(v35 + 16);
    uint64_t v96 = *(unsigned __int16 *)(v35 + 32);
    uint64_t v99 = v45;
    if (*(_WORD *)(v35 + 28))
    {
      if (v24 > v39)
      {
        uint64_t v93 = *(unsigned __int16 *)(v35 + 10);
        id v46 = [NSString alloc];
        uint64_t v47 = v98 + v34;
        id v44 = (id)objc_msgSend_initWithBytes_length_encoding_(v46, v48, v47, v38, 4);
        uint64_t v9 = v93;
        uint64_t v45 = v99;
        if (!v44)
        {
          id v49 = [NSString alloc];
          id v44 = (id)objc_msgSend_initWithBytes_length_encoding_(v49, v50, v47, v38, 12);
          uint64_t v9 = v93;
          uint64_t v45 = v99;
        }
      }
    }
    BOOL v51 = v45 > 4 && v42;
    BOOL v40 = v51;
    unint64_t v52 = v43 + v45;
    BOOL v53 = !v40 || v43 >= v52;
    BOOL v54 = !v53 && v52 > v24;
    if (!v54 || v52 > v23)
    {
      uint64_t v18 = v98;
    }
    else
    {
      unint64_t v75 = v43;
      uint64_t v18 = v98;
      do
      {
        v76 = (unsigned __int16 *)(v98 + v75);
        uint64_t v77 = *(unsigned __int16 *)(v98 + v75 + 2);
        unint64_t v78 = v75 + 4;
        v75 += 4 + v77;
        if (v75 <= v78 || v75 > v52) {
          break;
        }
        int v80 = *v76;
        if (v77 >= 0x18 && v80 == 1)
        {
          if (v36 == 0xFFFFFFFFLL) {
            uint64_t v36 = *(void *)(v98 + v78);
          }
          if (v37 == 0xFFFFFFFFLL) {
            uint64_t v37 = *(void *)(v88 + v78);
          }
          if (v39 == 0xFFFFFFFF) {
            unint64_t v39 = *(void *)(v87 + v78);
          }
        }
      }
      while (v75 < v52);
    }
    if (v44)
    {
      v94 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v56 = (uint64_t)v44;
      uint64_t v92 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v8, v9, v10);
      uint64_t v59 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v57, v39, v58);
      uint64_t v62 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v60, v95, v61);
      uint64_t v65 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v63, v37, v64);
      uint64_t v68 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v66, v36, v67);
      uint64_t v83 = v62;
      uint64_t v18 = v98;
      uint64_t v71 = objc_msgSend_dictionaryWithObjectsAndKeys_(v94, v69, v92, v70, @"NSZipFileArchiveCompressionType", v59, @"NSZipFileArchiveHeaderOffset", v83, @"NSZipFileArchiveCRC", v65, @"NSZipFileArchiveCompressedLength", v68, @"NSZipFileArchiveUncompressedLength", 0);
      objc_msgSend_addObject_(v90, v72, v56, v73);
      objc_msgSend_setObject_forKey_(v89, v74, v71, v56);
      uint64_t v45 = v99;
      char v91 = 1;
    }
    v8 = v97;
    unint64_t v33 = v43 + v45 + v96;
    ++v32;
  }
  while (v32 != v97);
  uint64_t v11 = v86;
  if ((v91 & 1) == 0)
  {
LABEL_80:
    if (!v11) {
      return v11;
    }
LABEL_81:
    objc_msgSend_dealloc(v11, v8, v9, v10);
    return 0;
  }
  v86->_data = (NSData *)v84;
  v86->_names = (NSArray *)v90;
  v86->_properties = (NSDictionary *)v89;
  if ((v85 & 4) != 0) {
    *(_DWORD *)&v86->_zFlags |= 8u;
  }
  return v11;
}

- (VFXNSZipFileArchive)initWithEntryNames:(id)a3 contents:(id)a4 properties:(id)a5 options:(unint64_t)a6
{
  unint64_t v10 = objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6);
  v29.receiver = self;
  v29.super_class = (Class)VFXNSZipFileArchive;
  uint64_t v14 = [(VFXNSZipFileArchive *)&v29 init];
  if (v10)
  {
    unint64_t v15 = 1;
    do
    {
      uint64_t v16 = objc_msgSend_objectAtIndex_(a3, v11, v15 - 1, v13);
      uint64_t v19 = objc_msgSend_objectForKey_(a4, v17, v16, v18);
      BOOL v20 = v19 != 0;
      if (v19) {
        BOOL v21 = v15 >= v10;
      }
      else {
        BOOL v21 = 1;
      }
      ++v15;
    }
    while (!v21);
    if (!a3) {
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v20 = 1;
    if (!a3) {
      goto LABEL_16;
    }
  }
  if (a4 && v20 && v14 && v10)
  {
    v14->_contents = (NSDictionary *)objc_msgSend_copy(a4, v11, v12, v13);
    v14->_names = (NSArray *)objc_msgSend_copy(a3, v22, v23, v24);
    v14->_properties = (NSDictionary *)objc_msgSend_copy(a5, v25, v26, v27);
    *(_DWORD *)&v14->_zFlags |= 8u;
    return v14;
  }
LABEL_16:
  if (v14)
  {
    objc_msgSend_dealloc(v14, v11, v12, v13);
    return 0;
  }
  return v14;
}

- (VFXNSZipFileArchive)initWithEntryNames:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VFXNSZipFileArchive;
  id v8 = [(VFXNSZipFileArchive *)&v14 init];
  if (objc_opt_respondsToSelector()) {
    *((_DWORD *)v8 + 20) |= 1u;
  }
  if (objc_opt_respondsToSelector()) {
    *((_DWORD *)v8 + 20) |= 2u;
  }
  if (objc_opt_respondsToSelector())
  {
    int v12 = *((_DWORD *)v8 + 20) | 4;
    *((_DWORD *)v8 + 20) = v12;
  }
  else
  {
    if (!v8) {
      return (VFXNSZipFileArchive *)v8;
    }
    int v12 = *((_DWORD *)v8 + 20);
  }
  if ((v12 & 3) != 0)
  {
    *((void *)v8 + 3) = a4;
    *((void *)v8 + 6) = objc_msgSend_copy(a3, v9, v10, v11);
    if ((v5 & 4) != 0) {
      *((_DWORD *)v8 + 20) |= 8u;
    }
  }
  else
  {
    objc_msgSend_dealloc(v8, v9, v10, v11);
    return 0;
  }
  return (VFXNSZipFileArchive *)v8;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)VFXNSZipFileArchive;
  [(VFXNSZipFileArchive *)&v5 dealloc];
}

- (id)entryNames
{
  return self->_names;
}

- (id)contentsForEntryName:(id)a3
{
  contents = self->_contents;
  if (contents)
  {
    uint64_t v7 = objc_msgSend_objectForKey_(contents, a2, (uint64_t)a3, v3);
LABEL_3:
    uint64_t v9 = (void *)v7;
    goto LABEL_4;
  }
  if (self->_data)
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_properties, a2, (uint64_t)a3, v3);
    if (v11)
    {
      objc_super v14 = v11;
      unint64_t v15 = objc_msgSend_objectForKey_(v11, v12, @"NSZipFileArchiveHeaderOffset", v13);
      unint64_t v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
      unint64_t v22 = objc_msgSend_objectForKey_(v14, v20, @"NSZipFileArchiveCompressionType", v21);
      uint64_t v26 = objc_msgSend_unsignedIntegerValue(v22, v23, v24, v25);
      objc_super v29 = objc_msgSend_objectForKey_(v14, v27, @"NSZipFileArchiveCRC", v28);
      uint64_t v33 = objc_msgSend_unsignedIntegerValue(v29, v30, v31, v32);
      uint64_t v36 = objc_msgSend_objectForKey_(v14, v34, @"NSZipFileArchiveCompressedLength", v35);
      uint64_t v40 = objc_msgSend_unsignedIntegerValue(v36, v37, v38, v39);
      unint64_t v43 = objc_msgSend_objectForKey_(v14, v41, @"NSZipFileArchiveUncompressedLength", v42);
      uint64_t v47 = objc_msgSend_unsignedIntegerValue(v43, v44, v45, v46);
      data = self->_data;
      uint64_t v52 = objc_msgSend_bytes(data, v49, v50, v51);
      unint64_t v56 = objc_msgSend_length(data, v53, v54, v55);
      if (v56 > v19 && v19 <= 0xFFFFFFFFFFFFFFE1)
      {
        uint64_t v9 = 0;
        if (!v47 || !v40 || v19 + 30 >= v56) {
          return v9;
        }
        uint64_t v59 = (unsigned __int16 *)(v52 + v19);
        if (*(_DWORD *)(v52 + v19) == 67324752 && v26 == v59[4])
        {
          unint64_t v60 = v19 + 30 + v59[13] + v59[14];
          if (v60 < v56)
          {
            uint64_t v9 = 0;
            unint64_t v61 = v60 + v40;
            if (v60 + v40 >= v56 || v61 <= v60 || v61 <= v19) {
              return v9;
            }
            if (v26 == 8)
            {
              uint64_t v70 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v57, v47, v58);
              v74 = (Bytef *)objc_msgSend_mutableBytes(v70, v71, v72, v73);
              *(_OWORD *)&v78.avail_in = 0u;
              memset(&v78.total_out, 0, 72);
              v78.next_in = (Bytef *)(v52 + v60);
              v78.avail_in = v40;
              v78.next_out = v74;
              *(void *)&v78.avail_out = v47;
              if (v70
                && (unint64_t v75 = v74, !inflateInit2_(&v78, -15, "1.2.12", 112))
                && (v76 = inflate(&v78, 4), int v77 = inflateEnd(&v78), v76 == 1))
              {
                uint64_t v9 = 0;
                if (!v77 && v78.total_out == v47)
                {
                  if (v33 == sub_1B661D778(v75, v47)) {
                    uint64_t v9 = v70;
                  }
                  else {
                    uint64_t v9 = 0;
                  }
                }
              }
              else
              {
                uint64_t v9 = 0;
              }
LABEL_4:
              if (!v9) {
                return v9;
              }
              goto LABEL_5;
            }
            if (!v26 && v33 == sub_1B661D778((const Bytef *)(v52 + v60), v40))
            {
              uint64_t v7 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v62, v52 + v60, v40);
              goto LABEL_3;
            }
          }
        }
      }
    }
    return 0;
  }
  if (!objc_msgSend_containsObject_(self->_names, a2, (uint64_t)a3, v3)) {
    return 0;
  }
  __zFlags zFlags = self->_zFlags;
  if ((*(unsigned char *)&zFlags & 1) == 0)
  {
    if ((*(unsigned char *)&zFlags & 2) != 0)
    {
      objc_msgSend_archive_streamForEntryName_(self->_provider, v63, (uint64_t)self, (uint64_t)a3);
    }
    else if ((*(unsigned char *)&zFlags & 0x10) == 0)
    {
      path = self->_path;
      if (path)
      {
        uint64_t v68 = sub_1B6532A48(path, v63, v64, v65);
        if ((v68 & 0x8000000000000000) == 0) {
          close(v68);
        }
      }
    }
    return 0;
  }
  uint64_t v9 = objc_msgSend_objectForKey_(self->_cachedContents, v63, (uint64_t)a3, v65);
  if (!v9)
  {
    uint64_t v7 = objc_msgSend_archive_contentsForEntryName_(self->_provider, v8, (uint64_t)self, (uint64_t)a3);
    goto LABEL_3;
  }
LABEL_5:
  if ((*(unsigned char *)&self->_zFlags & 8) == 0)
  {
    cachedContents = self->_cachedContents;
    if (!cachedContents)
    {
      cachedContents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_cachedContents = cachedContents;
    }
    objc_msgSend_setObject_forKey_(cachedContents, v8, (uint64_t)v9, (uint64_t)a3, v78.next_in, *(_OWORD *)&v78.avail_in, *(_OWORD *)&v78.next_out);
  }
  return v9;
}

- (id)streamForEntryName:(id)a3
{
  contents = self->_contents;
  if (contents)
  {
    uint64_t v7 = objc_msgSend_objectForKey_(contents, a2, (uint64_t)a3, v3);
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = MEMORY[0x1E4F1CA10];
LABEL_4:
      return (id)MEMORY[0x1F4181798](v10, sel_inputStreamWithData_, v9, v8);
    }
    return 0;
  }
  if (self->_data || !objc_msgSend_containsObject_(self->_names, a2, (uint64_t)a3, v3)) {
    return 0;
  }
  __zFlags zFlags = self->_zFlags;
  if (*(unsigned char *)&zFlags)
  {
    uint64_t v18 = objc_msgSend_objectForKey_(self->_cachedContents, v11, (uint64_t)a3, v13);
    if (!v18)
    {
      uint64_t v20 = objc_msgSend_archive_contentsForEntryName_(self->_provider, v17, (uint64_t)self, (uint64_t)a3);
      if (!v20) {
        return 0;
      }
      uint64_t v18 = v20;
      if ((*(unsigned char *)&self->_zFlags & 8) == 0)
      {
        cachedContents = self->_cachedContents;
        if (!cachedContents)
        {
          cachedContents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          self->_cachedContents = cachedContents;
        }
        objc_msgSend_setObject_forKey_(cachedContents, v21, v18, (uint64_t)a3);
      }
    }
    uint64_t v10 = MEMORY[0x1E4F1CA10];
    uint64_t v9 = v18;
    goto LABEL_4;
  }
  if ((*(unsigned char *)&zFlags & 2) == 0)
  {
    if ((*(unsigned char *)&zFlags & 0x10) == 0)
    {
      path = self->_path;
      if (path)
      {
        uint64_t v16 = sub_1B6532A48(path, v11, v12, v13);
        if ((v16 & 0x8000000000000000) == 0) {
          close(v16);
        }
      }
    }
    return 0;
  }
  id provider = self->_provider;

  return (id)objc_msgSend_archive_streamForEntryName_(provider, v11, (uint64_t)self, (uint64_t)a3);
}

- (BOOL)writeContentsForEntryName:(id)a3 toFile:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v8 = objc_msgSend_contentsForEntryName_(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v8)
  {
    LOBYTE(v8) = MEMORY[0x1F4181798](v8, sel_writeToFile_options_error_, a4, a5);
  }
  return v8;
}

- (id)propertiesForEntryName:(id)a3
{
  id result = (id)objc_msgSend_objectForKey_(self->_properties, a2, (uint64_t)a3, v3);
  if (!result)
  {
    if (objc_msgSend_containsObject_(self->_names, v7, (uint64_t)a3, v8))
    {
      if ((*(unsigned char *)&self->_zFlags & 4) == 0
        || (id result = (id)objc_msgSend_archive_propertiesForEntryName_(self->_provider, v9, (uint64_t)self, (uint64_t)a3)) == 0)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
        return (id)objc_msgSend_dictionary(v12, v9, v10, v11);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)archiveData
{
  v151 = objc_msgSend_data(MEMORY[0x1E4F1CA58], a2, v2, v3);
  v152 = objc_msgSend_data(MEMORY[0x1E4F1CA58], v5, v6, v7);
  v157 = self;
  uint64_t v11 = objc_msgSend_count(self->_names, v8, v9, v10);
  id v12 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v15 = (id)objc_msgSend_initWithCalendarIdentifier_(v12, v13, *MEMORY[0x1E4F1C318], v14);
  uint64_t v19 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v16, v17, v18);
  uint64_t v21 = objc_msgSend_components_fromDate_(v15, v20, 252, v19);
  unint64_t v25 = objc_msgSend_year(v21, v22, v23, v24);
  __int16 v29 = objc_msgSend_month(v21, v26, v27, v28);
  __int16 v33 = objc_msgSend_day(v21, v30, v31, v32);
  __int16 v37 = objc_msgSend_hour(v21, v34, v35, v36);
  __int16 v41 = objc_msgSend_minute(v21, v38, v39, v40);
  unint64_t v45 = objc_msgSend_second(v21, v42, v43, v44);
  __int16 v48 = ((_WORD)v25 << 9) - 30720;
  if (v25 < 0x7BC) {
    __int16 v48 = 0;
  }
  if (v11)
  {
    uint64_t v49 = 0;
    __int16 v148 = v33 | (32 * v29) | v48;
    __int16 v149 = (32 * v41) | (v37 << 11) | (v45 >> 1);
    uint64_t v150 = v11;
    do
    {
      uint64_t v50 = objc_msgSend_objectAtIndex_(v157->_names, v46, v49, v47);
      uint64_t v54 = (const char *)objc_msgSend_UTF8String(v50, v51, v52, v53);
      size_t v55 = strlen(v54);
      uint64_t v58 = objc_msgSend_contentsForEntryName_(v157, v56, (uint64_t)v50, v57);
      int v62 = objc_msgSend_length(v58, v59, v60, v61);
      if (v55) {
        BOOL v64 = v58 == 0;
      }
      else {
        BOOL v64 = 1;
      }
      if (!v64)
      {
        int v65 = v62;
        v66 = (const Bytef *)objc_msgSend_bytes(v58, v46, v63, v47);
        uInt v70 = objc_msgSend_length(v58, v67, v68, v69);
        unsigned int v71 = crc32(0, 0, 0);
        LODWORD(v66) = crc32(v71, v66, v70);
        unint64_t v75 = (unsigned __int8 *)objc_msgSend_bytes(v58, v72, v73, v74);
        uint64_t v79 = objc_msgSend_length(v58, v76, v77, v78);
        int v155 = (int)v66;
        if (v79)
        {
          while (1)
          {
            unsigned int v84 = *v75++;
            unsigned int v83 = v84;
            if (v84 <= 0x1F && v83 - 7 >= 7 && v83 - 26 > 1) {
              break;
            }
            if (!--v79) {
              goto LABEL_14;
            }
          }
          __int16 v153 = 0;
        }
        else
        {
LABEL_14:
          __int16 v153 = 1;
        }
        char v85 = (Bytef *)objc_msgSend_bytes(v58, v80, v81, v82);
        uint64_t v89 = objc_msgSend_length(v58, v86, v87, v88);
        uint64_t v93 = 0;
        int v156 = v65;
        if (v85)
        {
          uint64_t v94 = v89;
          if (v89)
          {
            uint64_t v95 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v90, v89 - 1, v92);
            memset(&strm.avail_in, 0, 104);
            strm.next_in = v85;
            strm.avail_in = v94;
            strm.next_out = (Bytef *)objc_msgSend_mutableBytes(v95, v96, v97, v98);
            strm.avail_out = v94 - 1;
            if (v95
              && !deflateInit2_(&strm, 6, 8, -15, 8, 0, "1.2.12", 112)
              && (int v99 = deflate(&strm, 4), v100 = deflateEnd(&strm), v99 == 1))
            {
              uint64_t v93 = 0;
              if (!v100 && v94 == strm.total_in)
              {
                objc_msgSend_setLength_(v95, v90, strm.total_out, v92);
                uint64_t v93 = v95;
              }
            }
            else
            {
              uint64_t v93 = 0;
            }
          }
        }
        __int16 v101 = 8 * (v93 != 0);
        if (v93) {
          v102 = v93;
        }
        else {
          v102 = v58;
        }
        uint64_t v154 = (uint64_t)v102;
        int v103 = objc_msgSend_length(v102, v90, v91, v92);
        v106 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v104, v55 + 30, v105);
        objc_msgSend_replaceBytesInRange_withBytes_(v106, v107, 0, 30, &unk_1B6E72D68);
        objc_msgSend_replaceBytesInRange_withBytes_(v106, v108, 30, v55, v54);
        uint64_t v112 = objc_msgSend_mutableBytes(v106, v109, v110, v111);
        *(_WORD *)(v112 + 4) = 20;
        *(_WORD *)(v112 + 8) = v101;
        *(_WORD *)(v112 + 10) = v149;
        *(_WORD *)(v112 + 12) = v148;
        *(_DWORD *)(v112 + 14) = v155;
        *(_DWORD *)(v112 + 18) = v103;
        *(_DWORD *)(v112 + 22) = v156;
        *(_WORD *)(v112 + 26) = v55;
        v115 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v113, v55 + 46, v114);
        objc_msgSend_replaceBytesInRange_withBytes_(v115, v116, 0, 46, &unk_1B6E72D86);
        objc_msgSend_replaceBytesInRange_withBytes_(v115, v117, 46, v55, v54);
        uint64_t v121 = objc_msgSend_mutableBytes(v115, v118, v119, v120);
        *(_WORD *)(v121 + 6) = 20;
        *(_WORD *)(v121 + 10) = v101;
        *(_WORD *)(v121 + 12) = v149;
        *(_WORD *)(v121 + 14) = v148;
        *(_DWORD *)(v121 + 16) = v155;
        *(_DWORD *)(v121 + 20) = v103;
        *(_DWORD *)(v121 + 24) = v156;
        *(_WORD *)(v121 + 28) = v55;
        *(_WORD *)(v121 + 36) = v153;
        *(_DWORD *)(v121 + 42) = objc_msgSend_length(v152, v122, v123, v124);
        objc_msgSend_appendData_(v152, v125, (uint64_t)v106, v126);
        objc_msgSend_appendData_(v152, v127, v154, v128);
        objc_msgSend_appendData_(v151, v129, (uint64_t)v115, v130);
        uint64_t v11 = v150;
      }
      ++v49;
    }
    while (v49 != v11);
  }
  v131 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v46, 22, v47);
  objc_msgSend_replaceBytesInRange_withBytes_(v131, v132, 0, 22, &unk_1B6E72DB4);
  uint64_t v136 = objc_msgSend_mutableBytes(v131, v133, v134, v135);
  *(_WORD *)(v136 + 8) = v11;
  *(_WORD *)(v136 + 10) = v11;
  *(_DWORD *)(v136 + 12) = objc_msgSend_length(v151, v137, v138, v139);
  *(_DWORD *)(v136 + 16) = objc_msgSend_length(v152, v140, v141, v142);
  objc_msgSend_appendData_(v152, v143, (uint64_t)v151, v144);
  objc_msgSend_appendData_(v152, v145, (uint64_t)v131, v146);
  return v152;
}

- (id)archiveStream
{
  id result = (id)objc_msgSend_archiveData(self, a2, v2, v3);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = MEMORY[0x1E4F1CA10];
    return (id)MEMORY[0x1F4181798](v7, sel_inputStreamWithData_, v6, v5);
  }
  return result;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = objc_msgSend_archiveData(self, a2, (uint64_t)a3, a4);
  if (v7)
  {
    LOBYTE(v7) = MEMORY[0x1F4181798](v7, sel_writeToFile_options_error_, a3, a4);
  }
  return v7;
}

- (void)invalidate
{
  contents = self->_contents;
  if (contents)
  {

    self->_contents = 0;
  }
  data = self->_data;
  if (data)
  {

    self->_data = 0;
  }
  self->_id provider = 0;
  __zFlags zFlags = self->_zFlags;
  self->___zFlags zFlags = (__zFlags)(*(_DWORD *)&zFlags & 0xFFFFFFF8);
  if ((*(unsigned char *)&zFlags & 0x10) != 0)
  {
    close(self->_desc);
    *(_DWORD *)&self->_zFlags &= ~0x10u;
  }
  path = self->_path;
  if (path)
  {

    self->_path = 0;
  }
  names = self->_names;
  if (names)
  {

    self->_names = 0;
  }
  properties = self->_properties;
  if (properties)
  {

    self->_properties = 0;
  }
  cachedContents = self->_cachedContents;
  if (cachedContents)
  {

    self->_cachedContents = 0;
  }
}

- (BOOL)isValid
{
  return self->_contents || self->_data || (*(unsigned char *)&self->_zFlags & 0x13) != 0 || self->_path != 0;
}

@end