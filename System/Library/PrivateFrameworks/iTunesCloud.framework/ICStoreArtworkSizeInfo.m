@interface ICStoreArtworkSizeInfo
- (BOOL)hasMaxSupportedSize;
- (BOOL)isEqual:(id)a3;
- (CGSize)maxSupportedSize;
- (NSArray)supportedSizes;
- (int64_t)type;
- (unint64_t)hash;
- (void)setHasMaxSupportedSize:(BOOL)a3;
- (void)setMaxSupportedSize:(CGSize)a3;
- (void)setSupportedSizes:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation ICStoreArtworkSizeInfo

- (int64_t)type
{
  return self->_type;
}

- (CGSize)maxSupportedSize
{
  double width = self->_maxSupportedSize.width;
  double height = self->_maxSupportedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)hasMaxSupportedSize
{
  return self->_hasMaxSupportedSize;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setMaxSupportedSize:(CGSize)a3
{
  self->_maxSupportedSize = a3;
}

- (void)setHasMaxSupportedSize:(BOOL)a3
{
  self->_hasMaxSupportedSize = a3;
}

- (void).cxx_destruct
{
}

- (void)setSupportedSizes:(id)a3
{
}

- (NSArray)supportedSizes
{
  return self->_supportedSizes;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v108 = __ROR8__(v14 + v13, 32);
  uint64_t v113 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v103 = (v14 + v13) ^ __ROR8__(v13, 47);

  int64_t type = self->_type;
  uint64_t v19 = (v17 + v103) ^ __ROR8__(v103, 51);
  uint64_t v20 = v108 + (v113 ^ type);
  uint64_t v21 = __ROR8__(v113 ^ type, 48);
  uint64_t v22 = (v20 ^ v21) + __ROR8__(v17 + v103, 32);
  uint64_t v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  uint64_t v24 = v20 + v19;
  uint64_t v109 = __ROR8__(v24, 32);
  uint64_t v114 = v23;
  int64_t v99 = v22 ^ type;
  uint64_t v104 = v24 ^ __ROR8__(v19, 47);
  v25 = self->_supportedSizes;
  uint64_t data = [(NSArray *)v25 hash];
  int64_t v26 = (v99 + v104) ^ __ROR8__(v104, 51);
  uint64_t v27 = v109 + (v114 ^ data);
  uint64_t v28 = __ROR8__(v114 ^ data, 48);
  uint64_t v29 = (v27 ^ v28) + __ROR8__(v99 + v104, 32);
  uint64_t v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  uint64_t v31 = v27 + v26;
  uint64_t v110 = __ROR8__(v31, 32);
  uint64_t v115 = v30;
  uint64_t v100 = v29 ^ data;
  uint64_t v105 = v31 ^ __ROR8__(v26, 47);

  unint64_t height = (unint64_t)self->_maxSupportedSize.height;
  unint64_t v33 = (self->_hasMaxSupportedSize | 0x1800000000000000) + 0x400000000000000;
  unint64_t v118 = v33;
  if ((v33 & 0x400000000000000) != 0)
  {
    if ((v33 & 0x300000000000000) != 0)
    {
      v95 = [MEMORY[0x1E4F28B00] currentHandler];
      v96 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v118);

      unint64_t v33 = v118;
    }
    uint64_t v40 = v33 & 0xFFFFFFFFFFFFFFLL | (height << 32);
    uint64_t v41 = (v100 + v105) ^ __ROR8__(v105, 51);
    uint64_t v42 = v110 + (v40 ^ v115);
    uint64_t v43 = __ROR8__(v40 ^ v115, 48);
    uint64_t v44 = (v42 ^ v43) + __ROR8__(v100 + v105, 32);
    uint64_t v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
    uint64_t v46 = v42 + v41;
    uint64_t v111 = __ROR8__(v46, 32);
    uint64_t v116 = v45;
    unint64_t v101 = v44 ^ v40;
    uint64_t v106 = v46 ^ __ROR8__(v41, 47);
    unint64_t v33 = v33 & 0xFF00000000000000 | HIDWORD(height);
  }
  else
  {
    if ((v33 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v91 = [MEMORY[0x1E4F28B00] currentHandler];
      v92 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      [v91 handleFailureInFunction:v92, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v118 file lineNumber description];

      unint64_t v33 = v118;
    }
    uint64_t v34 = (v100 + v105) ^ __ROR8__(v105, 51);
    uint64_t v35 = v110 + (v115 ^ height);
    uint64_t v36 = __ROR8__(v115 ^ height, 48);
    uint64_t v37 = (v35 ^ v36) + __ROR8__(v100 + v105, 32);
    uint64_t v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
    uint64_t v39 = v35 + v34;
    uint64_t v111 = __ROR8__(v39, 32);
    uint64_t v116 = v38;
    unint64_t v101 = v37 ^ height;
    uint64_t v106 = v39 ^ __ROR8__(v34, 47);
  }
  unint64_t width = (unint64_t)self->_maxSupportedSize.width;
  unint64_t v48 = v33 + 0x800000000000000;
  unint64_t v119 = v48;
  if ((v48 & 0x400000000000000) != 0)
  {
    if ((v48 & 0x300000000000000) != 0)
    {
      v97 = [MEMORY[0x1E4F28B00] currentHandler];
      v98 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      objc_msgSend(v97, "handleFailureInFunction:file:lineNumber:description:", v98, @"MSVHasher+SipHash.h", 105, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld", v119);

      unint64_t v48 = v119;
    }
    uint64_t v55 = v48 & 0xFFFFFFFFFFFFFFLL | (width << 32);
    unint64_t v56 = (v101 + v106) ^ __ROR8__(v106, 51);
    uint64_t v57 = v111 + (v55 ^ v116);
    uint64_t v58 = __ROR8__(v55 ^ v116, 48);
    uint64_t v59 = (v57 ^ v58) + __ROR8__(v101 + v106, 32);
    uint64_t v60 = v59 ^ __ROR8__(v57 ^ v58, 43);
    uint64_t v61 = v57 + v56;
    uint64_t v112 = __ROR8__(v61, 32);
    uint64_t v117 = v60;
    unint64_t v102 = v59 ^ v55;
    uint64_t v107 = v61 ^ __ROR8__(v56, 47);
    unint64_t v48 = v48 & 0xFF00000000000000 | HIDWORD(width);
  }
  else
  {
    if ((v48 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      v93 = [MEMORY[0x1E4F28B00] currentHandler];
      v94 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      [v93 handleFailureInFunction:v94, @"MSVHasher+SipHash.h", 101, @"_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld", v119 file lineNumber description];

      unint64_t v48 = v119;
    }
    unint64_t v49 = (v101 + v106) ^ __ROR8__(v106, 51);
    uint64_t v50 = v111 + (v116 ^ width);
    uint64_t v51 = __ROR8__(v116 ^ width, 48);
    uint64_t v52 = (v50 ^ v51) + __ROR8__(v101 + v106, 32);
    uint64_t v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
    uint64_t v54 = v50 + v49;
    uint64_t v112 = __ROR8__(v54, 32);
    uint64_t v117 = v53;
    unint64_t v102 = v52 ^ width;
    uint64_t v107 = v54 ^ __ROR8__(v49, 47);
  }
  unint64_t v62 = (v102 + v107) ^ __ROR8__(v107, 51);
  uint64_t v63 = v112 + (v117 ^ (v48 + 0x800000000000000));
  uint64_t v64 = __ROR8__(v117 ^ (v48 + 0x800000000000000), 48);
  uint64_t v65 = (v63 ^ v64) + __ROR8__(v102 + v107, 32);
  uint64_t v66 = v65 ^ __ROR8__(v63 ^ v64, 43);
  uint64_t v67 = v63 + v62;
  uint64_t v68 = v67 ^ __ROR8__(v62, 47);
  unint64_t v69 = (v65 ^ (v48 + 0x800000000000000)) + v68;
  uint64_t v70 = v69 ^ __ROR8__(v68, 51);
  uint64_t v71 = (__ROR8__(v67, 32) ^ 0xFFLL) + v66;
  uint64_t v72 = __ROR8__(v66, 48);
  uint64_t v73 = __ROR8__(v69, 32) + (v71 ^ v72);
  uint64_t v74 = v73 ^ __ROR8__(v71 ^ v72, 43);
  uint64_t v75 = v70 + v71;
  uint64_t v76 = v75 ^ __ROR8__(v70, 47);
  uint64_t v77 = v76 + v73;
  uint64_t v78 = v77 ^ __ROR8__(v76, 51);
  uint64_t v79 = __ROR8__(v75, 32) + v74;
  uint64_t v80 = __ROR8__(v74, 48);
  uint64_t v81 = __ROR8__(v77, 32) + (v79 ^ v80);
  uint64_t v82 = v81 ^ __ROR8__(v79 ^ v80, 43);
  uint64_t v83 = v78 + v79;
  uint64_t v84 = v83 ^ __ROR8__(v78, 47);
  uint64_t v85 = v84 + v81;
  uint64_t v86 = v85 ^ __ROR8__(v84, 51);
  uint64_t v87 = __ROR8__(v83, 32) + v82;
  uint64_t v88 = __ROR8__(v82, 48);
  uint64_t v89 = __ROR8__(v85, 32) + (v87 ^ v88);
  return (v86 + v87) ^ __ROR8__(v86, 47) ^ v89 ^ __ROR8__(v86 + v87, 32) ^ v89 ^ __ROR8__(v87 ^ v88, 43);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICStoreArtworkSizeInfo *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(ICStoreArtworkSizeInfo *)v4 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v5 = v4;
      int64_t v6 = [(ICStoreArtworkSizeInfo *)self type];
      if (v6 == [(ICStoreArtworkSizeInfo *)v5 type])
      {
        id v7 = [(ICStoreArtworkSizeInfo *)self supportedSizes];
        id v8 = [(ICStoreArtworkSizeInfo *)v5 supportedSizes];
        if (v7 == v8)
        {
        }
        else
        {
          v9 = v8;
          char v10 = [v7 isEqual:v8];

          if ((v10 & 1) == 0) {
            goto LABEL_11;
          }
        }
        BOOL v12 = [(ICStoreArtworkSizeInfo *)self hasMaxSupportedSize];
        if (v12 == [(ICStoreArtworkSizeInfo *)v5 hasMaxSupportedSize])
        {
          [(ICStoreArtworkSizeInfo *)self maxSupportedSize];
          double v15 = v14;
          double v17 = v16;
          [(ICStoreArtworkSizeInfo *)v5 maxSupportedSize];
          BOOL v11 = v17 == v19 && v15 == v18;
          goto LABEL_12;
        }
      }
LABEL_11:
      BOOL v11 = 0;
LABEL_12:

      goto LABEL_13;
    }
    BOOL v11 = 0;
  }
LABEL_13:

  return v11;
}

@end