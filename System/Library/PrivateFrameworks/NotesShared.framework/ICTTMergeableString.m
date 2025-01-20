@interface ICTTMergeableString
+ (id)timestampFromData:(id)a3;
- (BOOL)canMergeString:(id)a3;
- (BOOL)check:(id *)a3;
- (BOOL)graphIsEqual:(id)a3;
- (BOOL)hasLocalChanges;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFragment;
- (BOOL)selection:(id)a3 wasModifiedAfter:(id)a4;
- (BOOL)textEitherSideOfSelectionAnchor:(TopoID)a3 wasModifiedAfter:(id)a4;
- (ICCRTTCompatibleDocument)document;
- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4;
- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4 orderedSubstrings:(void *)a5;
- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4 orderedSubstrings:(void *)a5 timestamp:(id)a6 fragment:(BOOL)a7;
- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4 timestamp:(id)a5;
- (ICTTMergeableString)initWithData:(id)a3 replicaID:(id)a4;
- (ICTTMergeableString)initWithData:(id)a3 replicaID:(id)a4 fragment:(BOOL)a5;
- (ICTTMergeableString)initWithReplicaID:(id)a3;
- (ICTTMergeableString)initWithReplicaID:(id)a3 asFragment:(BOOL)a4;
- (ICTTMergeableStringDelegate)delegate;
- (ICTTVectorMultiTimestamp)timestamp;
- (NSHashTable)objectsNeedingUpdatedRanges;
- (NSMutableAttributedString)attributedString;
- (NSString)description;
- (NSUUID)replicaUUID;
- (TopoIDRange)insertAttributedString:(SEL)a3 after:(id)a4 before:(void *)a5;
- (id).cxx_construct;
- (id)characterRangesForSelection:(id)a3;
- (id)characterRangesForSelection:(id)a3 selectedSubstringsBlock:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dotDescription:(unint64_t)a3;
- (id)i_saveDeltasSinceTimestamp:(id)a3 toArchive:(void *)a4;
- (id)selectionForCharacterRanges:(id)a3;
- (id)selectionForCharacterRanges:(id)a3 selectionAffinity:(unint64_t)a4;
- (id)serialize;
- (id)serializeDeltaSinceTimestamp:(id)a3;
- (id)string;
- (int64_t)substring:(void *)a3 modifiedAfter:(id)a4;
- (int64_t)substring:(void *)a3 modifiedAfter:(id)a4 includeAttributes:(BOOL)a5 replicaID:(id *)a6;
- (unint64_t)getCharacterIndexForCharID:(TopoID)a3;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)mergeWithString:(id)a3;
- (unint64_t)mergeWithString:(id)a3 mergeTimestamps:(BOOL)a4;
- (unint64_t)replicaStyleClock;
- (unint64_t)replicaTextClock;
- (void)_testSetTextTimestamp:(unint64_t)a3;
- (void)beginAddAttributesForUniqueParagraphUUIDs;
- (void)beginEditing;
- (void)checkTimestampLogStyleErrors:(BOOL)a3;
- (void)cleanupObjectsNeedingUpdatedRanges;
- (void)coalesce;
- (void)dealloc;
- (void)deleteCharactersInRange:(_NSRange)a3;
- (void)deleteSubstrings:(uint64_t)a3 withCharacterRanges:(char)a4;
- (void)deleteSubstrings:(void *)a3 withCharacterRanges:(void *)a4;
- (void)dumpData;
- (void)dumpMergeData:(id)a3;
- (void)endAddAttributesForUniqueParagraphUUIDs;
- (void)endEditing;
- (void)endNodes;
- (void)enumerateHighlightableRangesModifiedAfter:(id)a3 includingAttributes:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateSubstrings:(id)a3;
- (void)generateIdsForLocalChanges;
- (void)generateIdsForLocalChangesSafeForSharedTimestamp:(BOOL)a3;
- (void)getCharacterRanges:(void *)a3 forSubstrings:(void *)a4;
- (void)getSubstringBeforeTopoID:(TopoID)a3;
- (void)getSubstrings:(void *)a3 forCharacterRange:(_NSRange)a4;
- (void)getSubstrings:(void *)a3 forTopoIDRange:(TopoIDRange *)a4;
- (void)getSubstrings:(void *)a3 inOrderedSubstrings:(void *)a4 forCharacterRange:(_NSRange)a5;
- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (void)insertString:(id)a3 atIndex:(unint64_t)a4;
- (void)invalidateCache;
- (void)mergeWith:(id)a3;
- (void)moveRange:(_NSRange)a3 toIndex:(unint64_t)a4;
- (void)orderedSubstrings;
- (void)realizeLocalChangesIn:(id)a3;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)resetLocalReplicaClocksToTimestampValues;
- (void)saveDeltaSinceTimestamp:(id)a3 toArchive:(void *)a4;
- (void)saveSubstrings:(void *)a3 archiveSet:(void *)a4 linkSet:(void *)a5 archivedString:(id *)a6 toArchive:(void *)a7;
- (void)saveToArchive:(void *)a3;
- (void)setAttributedString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocument:(id)a3;
- (void)setHasLocalChanges:(BOOL)a3;
- (void)setReplicaUUID:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)sortSplitNodes;
- (void)splitTopoSubstring:(void *)a3 atIndex:(unsigned int)a4;
- (void)startNodes;
- (void)traverseUnordered:(id)a3;
- (void)updateAttributedStringAfterMerge;
- (void)updateCache;
- (void)updateClock;
- (void)updateSubstringIndexes;
- (void)updateTimestampsInRange:(_NSRange)a3;
- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4;
@end

@implementation ICTTMergeableString

- (unint64_t)mergeWithString:(id)a3 mergeTimestamps:(BOOL)a4
{
  BOOL v4 = a4;
  v112[1] = *MEMORY[0x1E4F143B8];
  id v90 = a3;
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"DebugDumpMergeData"];

  if (v7) {
    [(ICTTMergeableString *)self dumpMergeData:v90];
  }
  [(ICTTMergeableString *)self generateIdsForLocalChanges];
  [v90 generateIdsForLocalChanges];
  [v90 checkTimestampLogStyleErrors:0];
  if (![(ICTTMergeableString *)self canMergeString:v90])
  {
    unint64_t v11 = 0;
    goto LABEL_127;
  }
  v8 = [(ICTTMergeableString *)self timestamp];
  v9 = [v90 timestamp];
  uint64_t v10 = [v8 compareTo:v9];

  if (v10)
  {
    memset(v108, 0, sizeof(v108));
    int v109 = 1065353216;
    long long v105 = 0u;
    long long v106 = 0u;
    int v107 = 1065353216;
    long long v102 = 0u;
    long long v103 = 0u;
    int v104 = 1065353216;
    long long v99 = 0u;
    long long v100 = 0u;
    int v101 = 1065353216;
    long long v96 = 0u;
    long long v97 = 0u;
    int v98 = 1065353216;
    uint64_t v12 = [(NSMutableAttributedString *)self->_attributedString length];
    int v13 = [v90 isFragment];
    uint64_t v86 = v12;
    BOOL v85 = v4;
    v14 = [(ICTTMergeableString *)self orderedSubstrings];
    v15 = *v14;
    v16 = v14[1];
    if (*v14 != v16)
    {
      uint64_t v10 = (uint64_t)&std::piecewise_construct;
      do
      {
        v17 = *v15;
        v92 = v17;
        *((void *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v108, v17, (uint64_t)&std::piecewise_construct, (uint64_t *)&v92)+ 4) = v17;
        if (v13)
        {
          uint64_t v18 = [v90 startNodes];
          v9 = *(id ***)v18;
          v19 = *(id ***)(v18 + 8);
          while (v9 != v19)
          {
            v20 = *v9;
            if ([**v9 isEqual:*v17])
            {
              unsigned int v21 = *((_DWORD *)v20 + 2);
              unsigned int v22 = *((_DWORD *)v17 + 2);
              if (v21 >= v22 && v21 < *((_DWORD *)v17 + 4) + v22)
              {
                v92 = (TopoSubstring **)v20;
                *((void *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v108, v20, (uint64_t)&std::piecewise_construct, (uint64_t *)&v92)+ 4) = v17;
              }
            }
            ++v9;
          }
        }
        ++v15;
      }
      while (v15 != v16);
    }
    v88 = (char **)[v90 orderedSubstrings];
    v23 = *v88;
    if (*v88 == v88[1])
    {
LABEL_44:
      id v87 = 0;
    }
    else
    {
      v9 = (id **)&v94;
      while (1)
      {
        uint64_t v24 = *(void *)v23;
        v25 = std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>(v108, *(void **)v23);
        v26 = v25;
        if (!v25) {
          break;
        }
        uint64_t v95 = v25[4];
        unsigned int v27 = *(_DWORD *)(v95 + 16);
        unsigned int v28 = *(_DWORD *)(v24 + 16);
        if (v27 <= v28)
        {
          if (v27 < v28)
          {
            v92 = 0;
            v92 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v24);
            v23 = std::vector<TopoSubstring *>::insert((uint64_t)v88, v23 + 8, (char *)&v92) - 8;
          }
        }
        else
        {
          v94 = 0;
          v29 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:");
          v94 = v29;
          id v30 = *(id *)v29;
          int v31 = *((_DWORD *)v29 + 2);
          v32 = (TopoSubstring **)v30;
          v92 = v32;
          int v93 = v31;
          v110 = (TopoSubstring *)&v92;
          *((void *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID&&>,std::tuple<>>((uint64_t)v108, &v92, (uint64_t)&std::piecewise_construct, (uint64_t **)&v110)+ 4) = v29;

          if (std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v96, &v95))
          {
            v92 = (TopoSubstring **)&v95;
            uint64_t v33 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)&v96, &v95, (uint64_t)&std::piecewise_construct, &v92)[3];
            v92 = &v94;
            std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)&v96, &v94, (uint64_t)&std::piecewise_construct, &v92)[3] = v33;
            std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__erase_unique<TopoSubstring *>(&v96, &v95);
          }
        }
        uint64_t v10 = *(void *)(v24 + 48);
        uint64_t v34 = *(void *)(v24 + 56);
        while (v10 != v34)
        {
          uint64_t v35 = *(void *)v10;
          v36 = std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>(v108, *(void **)v10);
          v110 = 0;
          if (!v36) {
            operator new();
          }
          uint64_t v37 = v36[4];
          v110 = (TopoSubstring *)v37;
          if (*(_DWORD *)(v37 + 8) != *(_DWORD *)(v35 + 8)
            || ([*(id *)v37 isEqual:*(void *)v35] & 1) == 0)
          {
            v38 = -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:");
            v92 = v38;
            *((void *)std::__hash_table<std::__hash_value_type<TopoID,TopoSubstring *>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,TopoSubstring *>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,TopoSubstring *>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>((uint64_t)v108, v38, (uint64_t)&std::piecewise_construct, (uint64_t *)&v92)+ 4) = v38;
            v110 = (TopoSubstring *)v38;
          }
          v94 = (TopoSubstring *)v26[4];
          v40 = (uint64_t **)*((void *)v94 + 6);
          v39 = (uint64_t **)*((void *)v94 + 7);
          if (v40 != v39)
          {
            while (*v40 != (uint64_t *)v110)
            {
              if (++v40 == v39)
              {
                v40 = (uint64_t **)*((void *)v94 + 7);
                break;
              }
            }
          }
          if (v40 == v39)
          {
            if (!std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v96, &v94))
            {
              uint64_t v42 = *((void *)v94 + 6);
              uint64_t v41 = *((void *)v94 + 7);
              v92 = &v94;
              std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)&v96, &v94, (uint64_t)&std::piecewise_construct, &v92)[3] = (v41 - v42) >> 3;
            }
            TopoSubstring::addChild(v94, v110);
          }
          v10 += 8;
        }
        v23 += 8;
        if (v23 == v88[1]) {
          goto LABEL_44;
        }
      }
      id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v111 = *MEMORY[0x1E4F28588];
      v112[0] = @"Reached substring that is not in our graph.";
      v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:&v111 count:1];
      id v87 = (id)[v43 initWithDomain:@"TopoText" code:-3 userInfo:v44];
    }
    [(ICTTMergeableString *)self invalidateCache];
    if (v87 || (v91 = 0, BOOL v45 = [(ICTTMergeableString *)self check:&v91], v87 = v91, !v45))
    {
      v78 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        -[ICTTMergeableString mergeWithString:mergeTimestamps:]((uint64_t)v87, v78);
      }

      v79 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
        -[ICTTMergeableString mergeWithString:mergeTimestamps:]();
      }

      for (i = (void *)v97; i; i = (void *)*i)
        std::vector<TopoSubstring *>::resize(i[2] + 48, i[3]);
      traverseUnorderedSimple((uint64_t)*self->_startNodes.__begin_, &__block_literal_global_10);
      traverseUnorderedSimple((uint64_t)*self->_startNodes.__begin_, &__block_literal_global_86);
      -[NSMutableAttributedString replaceCharactersInRange:withString:](self->_attributedString, "replaceCharactersInRange:withString:", v86, [(NSMutableAttributedString *)self->_attributedString length] - v86, &stru_1F1F2FFF8);
      for (j = (void *)v103; j; j = (void *)*j)
      {
        uint64_t v82 = j[2];
        if (v82)
        {
          v83 = *(void **)(v82 + 48);
          if (v83)
          {
            *(void *)(v82 + 56) = v83;
            operator delete(v83);
          }

          MEMORY[0x1C877D640](v82, 0x1080C40D9F1C51ELL);
        }
      }
      [(ICTTMergeableString *)self invalidateCache];
      [(ICTTMergeableString *)self coalesce];
      [(ICTTMergeableString *)self dumpMergeData:v90];
      unint64_t v11 = 0;
    }
    else
    {
      v46 = *v88;
      if (*v88 != v88[1])
      {
        uint64_t v10 = (uint64_t)&v99;
        while (1)
        {
          v9 = *(id ***)v46;
          v47 = (TopoSubstring **)std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>(v108, *(void **)v46)[4];
          v92 = v47;
          unsigned int v48 = *((_DWORD *)v47 + 8);
          unsigned int v49 = *((_DWORD *)v9 + 8);
          if (v48 < v49) {
            goto LABEL_51;
          }
          if (v48 == v49 && [(TopoSubstring *)v47[3] TTCompare:v9[3]] == -1) {
            break;
          }
LABEL_73:
          v46 += 8;
          if (v46 == v88[1]) {
            goto LABEL_74;
          }
        }
        v47 = v92;
LABEL_51:
        if (*((unsigned char *)v47 + 44))
        {
          if (*((unsigned char *)v9 + 44))
          {
LABEL_61:
            if (!*((unsigned char *)v9 + 44))
            {
              attributedString = self->_attributedString;
              if (*((unsigned char *)v92 + 44))
              {
                int v52 = ICTTBoundedCheckedCastNSUIntegerToUInt32([(NSMutableAttributedString *)self->_attributedString length]);
                *((_DWORD *)v92 + 10) = v52;
                v53 = self->_attributedString;
                v54 = [v90 string];
                if (*((unsigned char *)v9 + 44)) {
                  uint64_t v55 = 0;
                }
                else {
                  uint64_t v55 = *((unsigned int *)v9 + 4);
                }
                -[NSMutableAttributedString ic_appendAttributedSubstring:fromRange:](v53, "ic_appendAttributedSubstring:fromRange:", v54, *((unsigned int *)v9 + 10), v55);
              }
              else
              {
                uint64_t v56 = *((unsigned int *)v92 + 10);
                uint64_t v57 = *((unsigned int *)v92 + 4);
                v54 = [v90 string];
                if (*((unsigned char *)v9 + 44)) {
                  uint64_t v58 = 0;
                }
                else {
                  uint64_t v58 = *((unsigned int *)v9 + 4);
                }
                -[NSMutableAttributedString ic_replaceCharactersInRange:withAttributedSubstring:fromRange:](attributedString, "ic_replaceCharactersInRange:withAttributedSubstring:fromRange:", v56, v57, v54, *((unsigned int *)v9 + 10), v58);
              }
            }
            v59 = (id *)v92;
            *((unsigned char *)v92 + 44) = *((unsigned char *)v9 + 44);
            objc_storeStrong(v59 + 3, v9[3]);
            *((_DWORD *)v59 + 8) = *((_DWORD *)v9 + 8);
            goto LABEL_73;
          }
          v50 = &v102;
        }
        else if (*((unsigned char *)v9 + 44))
        {
          v50 = &v105;
        }
        else
        {
          v50 = &v99;
        }
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v50, &v92, &v92);
        goto LABEL_61;
      }
LABEL_74:
      [(ICTTMergeableString *)self sortSplitNodes];
      [(ICTTMergeableString *)self invalidateCache];
      [v90 invalidateCache];
      [(ICTTMergeableString *)self updateAttributedStringAfterMerge];
      if (v85)
      {
        v60 = [(ICTTMergeableString *)self timestamp];
        v9 = [v90 timestamp];
        [v60 mergeWithTimestamp:v9];

        [(ICTTMergeableString *)self updateClock];
        [(ICTTMergeableString *)self checkTimestampLogStyleErrors:1];
      }
      v61 = [(ICTTMergeableString *)self delegate];
      v62 = v61;
      if (v61)
      {
        v89 = v61;
        [v61 beginEditing];
        v63 = [(ICTTMergeableString *)self orderedSubstrings];
        v64 = *v63;
        v65 = v63[1];
        if (*v63 != v65)
        {
          char v66 = 0;
          uint64_t v67 = 0;
          v68 = 0;
          do
          {
            v92 = *v64;
            v69 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v102, &v92);
            v70 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v105, &v92);
            BOOL v71 = v70 != 0;
            if (v69)
            {
              if (!*((unsigned char *)v92 + 44))
              {
                if (v66) {
                  uint64_t v72 = v67;
                }
                else {
                  uint64_t v72 = 0;
                }
                if ((v66 & 1) == 0)
                {
                  uint64_t v10 = 0;
                  v9 = v68;
                }
                uint64_t v67 = v72 + *((unsigned int *)v92 + 4);
                char v66 = 1;
              }
            }
            else
            {
              v73 = v70;
              if (v70)
              {
                if (v66) {
                  uint64_t v74 = v67;
                }
                else {
                  uint64_t v74 = 0;
                }
                if (v66) {
                  uint64_t v75 = v10;
                }
                else {
                  uint64_t v75 = 0;
                }
                if ((v66 & 1) == 0) {
                  v9 = v68;
                }
                uint64_t v76 = *((unsigned int *)v92 + 4);
                uint64_t v10 = v75 + v76;
                uint64_t v67 = v74 - v76;
              }
              else if (v66)
              {
                objc_msgSend(v89, "edited:range:changeInLength:", 2, v9, v10, v67);
                v68 = (id **)((char *)v68 + v67);
              }
              if (std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v99, &v92))
              {
                objc_msgSend(v89, "edited:range:changeInLength:", 1, v68, *((unsigned int *)v92 + 4), 0);
              }
              if (*((unsigned char *)v92 + 44)) {
                BOOL v77 = v73 == 0;
              }
              else {
                BOOL v77 = 0;
              }
              if (v77)
              {
                char v66 = 0;
              }
              else
              {
                v68 = (id **)((char *)v68 + *((unsigned int *)v92 + 4));
                char v66 = v71;
              }
            }
            ++v64;
          }
          while (v64 != v65);
        }
        v62 = v89;
        [v89 endEditing];
      }
      if (*((void *)&v106 + 1) | *((void *)&v103 + 1) | *((void *)&v100 + 1)) {
        unint64_t v11 = 2;
      }
      else {
        unint64_t v11 = 1;
      }
    }
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v96);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v99);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v102);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v105);
    std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::~__hash_table((uint64_t)v108);

    goto LABEL_127;
  }
  unint64_t v11 = 1;
LABEL_127:

  return v11;
}

- (unint64_t)length
{
  v2 = [(ICTTMergeableString *)self string];
  unint64_t v3 = [v2 length];

  return v3;
}

- (id)string
{
  return self->_attributedString;
}

void *__30__ICTTMergeableString_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(void *)(*(void *)(a1 + 32) + 8) + 48, &v3, &v3);
}

void __29__ICTTMergeableString_check___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = *(id *)a2;
  uint64_t v7 = *(unsigned int *)(a2 + 16);
  if (v7)
  {
    uint64_t v8 = *(unsigned int *)(a2 + 8);
    v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    uint64_t v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "intersectsIndexesInRange:", v8, v7))
      {
        id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v16 = *MEMORY[0x1E4F28588];
        v17[0] = @"ICTTMergeableString graph has two characters with the same id.";
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
        uint64_t v13 = [v11 initWithDomain:@"TopoText" code:-2 userInfo:v12];
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
        v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        *a3 = 1;
      }
      else
      {
        objc_msgSend(v10, "addIndexesInRange:", v8, v7);
      }
    }
    else
    {
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", v8, v7);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
    }
  }
}

- (void)invalidateCache
{
  self->_cacheInvalid = 1;
  self->_orderedSubstrings.__end_ = self->_orderedSubstrings.__begin_;
}

- (void)generateIdsForLocalChanges
{
  id v3 = [(ICTTMergeableString *)self timestamp];
  -[ICTTMergeableString generateIdsForLocalChangesSafeForSharedTimestamp:](self, "generateIdsForLocalChangesSafeForSharedTimestamp:", [v3 isDocumentShared]);
}

- (void)generateIdsForLocalChangesSafeForSharedTimestamp:(BOOL)a3
{
  if (self->_hasLocalChanges)
  {
    BOOL v3 = a3;
    unint64_t replicaStyleClock = self->_replicaStyleClock;
    v5 = [(ICTTMergeableString *)self orderedSubstrings];
    id v6 = *v5;
    uint64_t v7 = v5[1];
    if (*v5 == v7)
    {
      [(ICTTMergeableString *)self cleanupObjectsNeedingUpdatedRanges];
      goto LABEL_32;
    }
    BOOL v28 = v3;
    char v8 = 0;
    while (1)
    {
      v9 = *v6;
      uint64_t v10 = **v6;
      id v11 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");

      if (v10 == v11) {
        break;
      }
      uint64_t v12 = v9[3];
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");

      if (v12 == v13)
      {
        int v14 = *((_DWORD *)v9 + 8);
        LODWORD(v15) = v14 + 8;
        if (*((unsigned char *)v9 + 44)) {
          unint64_t v15 = v15;
        }
        else {
          unint64_t v15 = (v14 + 1);
        }
        if (replicaStyleClock <= v15) {
          unint64_t v16 = v15;
        }
        else {
          unint64_t v16 = replicaStyleClock;
        }
        if (v16 + 1 > self->_replicaStyleClock) {
          unint64_t v17 = v16 + 1;
        }
        else {
          unint64_t v17 = self->_replicaStyleClock;
        }
        self->_unint64_t replicaStyleClock = v17;
        objc_storeStrong(v9 + 3, self->_replicaUUID);
        *((_DWORD *)v9 + 8) = v16;
LABEL_21:
        char v8 = 1;
      }
      if (++v6 == v7)
      {
        [(ICTTMergeableString *)self cleanupObjectsNeedingUpdatedRanges];
        if ((v8 & 1) == 0) {
          goto LABEL_32;
        }
        timestamp = self->_timestamp;
        if (v28)
        {
          if (-[ICTTVectorMultiTimestamp clockForUUID:atIndex:](timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 0) < self->_replicaTextClock)-[ICTTVectorMultiTimestamp setClock:forUUID:atIndex:](self->_timestamp, "setClock:forUUID:atIndex:"); {
          if ([(ICTTVectorMultiTimestamp *)self->_timestamp clockForUUID:self->_replicaUUID atIndex:1] >= self->_replicaStyleClock)
          }
          {
LABEL_32:
            self->_unserializedClock = 0;
            self->_hasLocalChanges = 0;
            return;
          }
        }
        else
        {
          [(ICTTVectorMultiTimestamp *)timestamp setClock:self->_replicaTextClock forUUID:self->_replicaUUID atIndex:0];
        }
        [(ICTTVectorMultiTimestamp *)self->_timestamp setClock:self->_replicaStyleClock forUUID:self->_replicaUUID atIndex:1];
        goto LABEL_32;
      }
    }
    replicaUUID = self->_replicaUUID;
    v19 = replicaUUID;
    int replicaTextClock = self->_replicaTextClock;
    uint64_t v21 = *((unsigned int *)v9 + 4);
    id v33 = *v9;
    int v22 = *((_DWORD *)v9 + 4);
    int v34 = *((_DWORD *)v9 + 2);
    int v35 = v22;
    v23 = v19;
    id v30 = v23;
    int v31 = replicaTextClock;
    int v32 = v21;
    [(ICTTMergeableString *)self updateTopoIDRange:&v33 toNewRangeID:&v30];
    objc_storeStrong(v9, replicaUUID);
    uint64_t v24 = v9[3];
    *((_DWORD *)v9 + 2) = replicaTextClock;
    *((_DWORD *)v9 + 4) = v21;
    self->_replicaTextClock += v21;
    v25 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");

    if (v24 == v25)
    {
      objc_storeStrong(v9 + 3, self->_replicaUUID);
      *((_DWORD *)v9 + 8) = 0;
      unint64_t v26 = self->_replicaStyleClock;
      if (v26 <= 1) {
        unint64_t v26 = 1;
      }
      self->_unint64_t replicaStyleClock = v26;
    }

    goto LABEL_21;
  }
}

- (void)checkTimestampLogStyleErrors:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke;
  v3[3] = &unk_1E64A5468;
  v3[4] = self;
  BOOL v4 = a3;
  [(ICTTMergeableString *)self traverseUnordered:v3];
}

- (void)traverseUnordered:(id)a3
{
  id v6 = a3;
  begin = (uint64_t *)self->_startNodes.__begin_;
  end = self->_startNodes.__end_;
  while (begin != (uint64_t *)end)
    traverseUnordered(*begin++, v6);
}

- (void)setDelegate:(id)a3
{
}

- (ICTTMergeableString)initWithReplicaID:(id)a3
{
  return [(ICTTMergeableString *)self initWithReplicaID:a3 asFragment:0];
}

- (ICTTMergeableStringDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICTTMergeableStringDelegate *)WeakRetained;
}

void __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16))
  {
    id v4 = *(id *)a2;
    v5 = [MEMORY[0x1E4F29128] TTZero];
    char v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      int v7 = *(_DWORD *)(a2 + 8);
      int v8 = *(_DWORD *)(a2 + 16);
      v9 = [*(id *)(a1 + 32) timestamp];
      uint64_t v10 = [v9 clockForUUID:v4 atIndex:0];

      if (v4)
      {
        if (v10 <= (v8 + v7 - 1))
        {
          id v11 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_2();
          }

          uint64_t v12 = [*(id *)(a1 + 32) timestamp];
          [v12 setClock:(v8 + v7) forUUID:v4 atIndex:0];
        }
      }
    }
    id v13 = *(id *)(a2 + 24);
    int v14 = [MEMORY[0x1E4F29128] TTZero];
    char v15 = [v13 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = *(unsigned int *)(a2 + 32);
      unint64_t v17 = [*(id *)(a1 + 32) timestamp];
      uint64_t v18 = [v17 clockForUUID:v13 atIndex:1];

      if (v13)
      {
        if (v18 <= v16)
        {
          if (*(unsigned char *)(a1 + 40))
          {
            v19 = os_log_create("com.apple.notes", "Topotext");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_1();
            }
          }
          v20 = [*(id *)(a1 + 32) timestamp];
          [v20 setClock:(v16 + 1) forUUID:v13 atIndex:1];
        }
      }
    }
  }
}

- (ICTTVectorMultiTimestamp)timestamp
{
  return self->_timestamp;
}

- (void)updateClock
{
  if (self->_replicaUUID)
  {
    id v28 = [MEMORY[0x1E4F29128] TTZero];
    BOOL v3 = [MEMORY[0x1E4F29128] TTZero];
    id v4 = [(ICTTMergeableString *)self orderedSubstrings];
    unsigned int v27 = self;
    v5 = *v4;
    char v6 = v4[1];
    if (*v4 != v6)
    {
      unsigned int v7 = 0;
      unsigned int v8 = 0;
      while (1)
      {
        v9 = *v5;
        uint64_t v10 = **v5;
        id v11 = objc_msgSend(MEMORY[0x1E4F29128], "TTZero", v27);
        if ([v10 isEqual:v11]) {
          goto LABEL_12;
        }
        id v12 = *v9;
        id v13 = v12;
        unsigned int v14 = *((_DWORD *)v9 + 2) + *((_DWORD *)v9 + 4) - 1;
        if (v14 > v7) {
          break;
        }
        if (v14 != v7)
        {

          goto LABEL_12;
        }
        uint64_t v16 = [v12 TTCompare:v28];

        if (v16 == 1) {
          goto LABEL_7;
        }
LABEL_13:
        unint64_t v17 = v9[3];
        uint64_t v18 = [MEMORY[0x1E4F29128] TTZero];
        if (([v17 isEqual:v18] & 1) == 0)
        {
          unsigned int v19 = *((_DWORD *)v9 + 8);
          if (v19 > v8)
          {

LABEL_17:
            id v20 = v9[3];

            unsigned int v8 = *((_DWORD *)v9 + 8);
            BOOL v3 = v20;
            goto LABEL_18;
          }
          if (v19 == v8)
          {
            uint64_t v21 = [v9[3] TTCompare:v3];

            if (v21 != 1) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }
        }

LABEL_18:
        if (++v5 == v6) {
          goto LABEL_25;
        }
      }

LABEL_7:
      id v15 = *v9;
      id v11 = v28;
      unsigned int v7 = *((_DWORD *)v9 + 2) + *((_DWORD *)v9 + 4) - 1;
      id v28 = v15;
LABEL_12:

      goto LABEL_13;
    }
    unsigned int v8 = 0;
    unsigned int v7 = 0;
LABEL_25:
    int v22 = v27;
    uint64_t v23 = objc_msgSend(v28, "TTCompare:", v27->_replicaUUID, v27);
    uint64_t v24 = [v3 TTCompare:v22->_replicaUUID];
    if (v23 == -1) {
      unint64_t v25 = v7;
    }
    else {
      unint64_t v25 = v7 + 1;
    }
    if (v24 == -1) {
      unint64_t v26 = v8;
    }
    else {
      unint64_t v26 = v8 + 1;
    }
    v22->_int replicaTextClock = v25;
    v22->_unint64_t replicaStyleClock = v26;
  }
}

- (ICTTMergeableString)initWithReplicaID:(id)a3 asFragment:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICTTMergeableString;
  unsigned int v8 = [(ICTTMergeableString *)&v16 init];
  if (v8)
  {
    if (!v7) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"replicaID" functionName:"-[ICTTMergeableString initWithReplicaID:asFragment:]" simulateCrash:1 showAlert:0 format:@"Trying to create a mergeable string without a replica ID"];
    }
    objc_storeStrong((id *)&v8->_replicaUUID, a3);
    v8->_unserializedClock = 0;
    if (!a4) {
      operator new();
    }
    v9 = [[ICTTVectorMultiTimestamp alloc] initWithCapacity:2];
    timestamp = v8->_timestamp;
    v8->_timestamp = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:5];
    objectsNeedingUpdatedRanges = v8->_objectsNeedingUpdatedRanges;
    v8->_objectsNeedingUpdatedRanges = (NSHashTable *)v11;

    v8->_cacheInvalid = 1;
    id v13 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
    attributedString = v8->_attributedString;
    v8->_attributedString = v13;
  }
  return v8;
}

- (BOOL)check:(id *)a3
{
  v69[1] = *MEMORY[0x1E4F143B8];
  if (!hasLoop(*self->_startNodes.__begin_))
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    char v63 = 1;
    uint64_t v54 = 0;
    uint64_t v55 = &v54;
    uint64_t v56 = 0x3032000000;
    uint64_t v57 = __Block_byref_object_copy__39;
    uint64_t v58 = __Block_byref_object_dispose__40;
    id v59 = 0;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __29__ICTTMergeableString_check___block_invoke;
    v50[3] = &unk_1E64A5440;
    id v6 = v9;
    id v51 = v6;
    int v52 = &v54;
    v53 = &v60;
    [(ICTTMergeableString *)self traverseUnordered:v50];
    unsigned int v10 = 0;
    LODWORD(v11) = 0;
    v36 = v39;
    uint64_t v37 = *MEMORY[0x1E4F28588];
    while (1)
    {
      id v12 = [(ICTTMergeableString *)self orderedSubstrings];
      unsigned int v13 = v10;
      unsigned int v14 = v61;
      if (v10 >= (unint64_t)((uint64_t)(v12[1] - *v12) >> 3) || !*((unsigned char *)v61 + 24)) {
        break;
      }
      uint64_t v15 = *(void *)(*(void *)[(ICTTMergeableString *)self orderedSubstrings] + 8 * v10);
      id v16 = *(id *)v15;
      *(void *)&v39[7] = v16;
      int v17 = *(_DWORD *)(v15 + 16);
      int v40 = *(_DWORD *)(v15 + 8);
      int v41 = v17;
      id v18 = *(id *)(v15 + 24);
      id v42 = v18;
      int v19 = *(_DWORD *)(v15 + 40);
      int v43 = *(_DWORD *)(v15 + 32);
      int v44 = v19;
      char v45 = *(unsigned char *)(v15 + 44);
      int v49 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      uint64_t v46 = 0;
      if (!v45)
      {
        id v20 = [(ICTTMergeableString *)self attributedString];
        unint64_t v11 = (v17 + v11);
        BOOL v21 = [v20 length] < v11;

        if (v21)
        {
          int v22 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            [(ICTTMergeableString *)&buf check:v22];
          }

          *((unsigned char *)v61 + 24) = 0;
          id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v66 = v37;
          uint64_t v67 = @"ICTTMergeableString substring max > string max.";
          uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
          uint64_t v25 = [v23 initWithDomain:@"TopoText" code:-3 userInfo:v24];
          unint64_t v26 = (void *)v55[5];
          v55[5] = v25;

          unsigned int v14 = v61;
          break;
        }
      }

      unsigned int v10 = v13 + 1;
    }
    if (*((unsigned char *)v14 + 24))
    {
      unsigned int v27 = [(ICTTMergeableString *)self attributedString];
      BOOL v28 = [v27 length] == v11;

      if (!v28)
      {
        *((unsigned char *)v61 + 24) = 0;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v64 = v37;
        v65 = @"ICTTMergeableString length of substrings != attributedString length.";
        id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        uint64_t v31 = [v29 initWithDomain:@"TopoText" code:-4 userInfo:v30];
        int v32 = (void *)v55[5];
        v55[5] = v31;

        [(ICTTMergeableString *)self dumpData];
        id v33 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[ICTTMergeableString check:]();
        }
      }
    }
    if (a3)
    {
      int v34 = (void *)v55[5];
      if (v34) {
        *a3 = v34;
      }
    }
    BOOL v8 = *((unsigned char *)v61 + 24) != 0;

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v60, 8);
    goto LABEL_23;
  }
  if (a3)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v68 = *MEMORY[0x1E4F28588];
    v69[0] = @"ICTTMergeableString graph has loop.";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
    id v7 = (id)[v5 initWithDomain:@"TopoText" code:-1 userInfo:v6];
    BOOL v8 = 0;
    *a3 = v7;
LABEL_23:

    return v8;
  }
  return 0;
}

- (void)orderedSubstrings
{
  if (self->_cacheInvalid) {
    [(ICTTMergeableString *)self updateCache];
  }
  return &self->_orderedSubstrings;
}

- (void)updateCache
{
  p_orderedSubstrings = &self->_orderedSubstrings;
  begin = self->_orderedSubstrings.__begin_;
  self->_orderedSubstrings.__end_ = begin;
  self->_cacheInvalid = 0;
  id v5 = self->_startNodes.__begin_;
  end = self->_startNodes.__end_;
  if (v5 == end)
  {
    id v9 = begin;
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    do
    {
      uint64_t v8 = (uint64_t)*v5;
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __34__ICTTMergeableString_updateCache__block_invoke;
      v10[3] = &unk_1E64A53F0;
      v10[4] = self;
      traverseIterative(v8, v10);
      ++v5;
    }
    while (v5 != end);
    begin = self->_orderedSubstrings.__begin_;
    id v9 = self->_orderedSubstrings.__end_;
  }
  if (((char *)v9 - (char *)begin) >> 2 < (unint64_t)(self->_orderedSubstrings.__end_cap_.__value_ - begin)) {
    std::vector<TopoSubstring *>::shrink_to_fit((uint64_t)p_orderedSubstrings);
  }
}

void __34__ICTTMergeableString_updateCache__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[8];
  unint64_t v5 = v3[9];
  if ((unint64_t)v4 >= v5)
  {
    uint64_t v7 = v3[7];
    uint64_t v8 = ((uint64_t)v4 - v7) >> 3;
    if ((unint64_t)(v8 + 1) >> 61) {
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = v5 - v7;
    uint64_t v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1)) {
      uint64_t v10 = v8 + 1;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    if (v11) {
      id v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)(v3 + 9), v11);
    }
    else {
      id v12 = 0;
    }
    unsigned int v13 = &v12[8 * v8];
    unsigned int v14 = &v12[8 * v11];
    *(void *)unsigned int v13 = a2;
    id v6 = v13 + 8;
    id v16 = (char *)v3[7];
    uint64_t v15 = (char *)v3[8];
    if (v15 != v16)
    {
      do
      {
        uint64_t v17 = *((void *)v15 - 1);
        v15 -= 8;
        *((void *)v13 - 1) = v17;
        v13 -= 8;
      }
      while (v15 != v16);
      uint64_t v15 = (char *)v3[7];
    }
    v3[7] = v13;
    v3[8] = v6;
    v3[9] = v14;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    *id v4 = a2;
    id v6 = v4 + 1;
  }
  v3[8] = v6;
}

- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4 orderedSubstrings:(void *)a5 timestamp:(id)a6 fragment:(BOOL)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = (ICTTVectorMultiTimestamp *)a6;
  char v45 = v11;
  unsigned int v13 = [(ICTTMergeableString *)self initWithReplicaID:v11 asFragment:1];

  if (!v13) {
    goto LABEL_40;
  }
  if (*((unsigned char *)a3 + 32))
  {
    id v14 = [NSString alloc];
    uint64_t v15 = (uint64_t *)*((void *)a3 + 5);
    if (*((char *)v15 + 23) < 0)
    {
      uint64_t v15 = (uint64_t *)*v15;
      uint64_t v16 = *(void *)(*((void *)a3 + 5) + 8);
    }
    else
    {
      uint64_t v16 = *((unsigned __int8 *)v15 + 23);
    }
    uint64_t v17 = [v14 initWithBytes:v15 length:v16 encoding:4];
    if (v17)
    {
      id v18 = (void *)v17;
      int v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v17];
      BOOL v40 = a7;
      int v41 = v18;
      [(ICTTMergeableString *)v13 setAttributedString:v19];

      unint64_t v20 = *((unsigned int *)a3 + 14);
      v53 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      std::vector<TopoSubstring *>::reserve((void **)&v53, v20);
      if (v20) {
        operator new();
      }
      BOOL v21 = v12;
      if (!v12)
      {
        int v22 = [ICTTVectorMultiTimestamp alloc];
        id v23 = v22;
        uint64_t v24 = *((void *)a3 + 9);
        if (!v24) {
          uint64_t v24 = *(void *)(topotext::String::default_instance((topotext::String *)v22) + 72);
        }
        BOOL v21 = [(ICTTVectorMultiTimestamp *)v23 initWithArchive:v24 andCapacity:2];
      }
      [(ICTTMergeableString *)v13 setTimestamp:v21];
      if (!v12) {

      }
      uint64_t v25 = [(ICTTMergeableString *)v13 timestamp];
      id v42 = [v25 sortedUUIDs];

      [v42 count];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id obj = v42;
      uint64_t v26 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v50;
        while (2)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v50 != v27) {
              objc_enumerationMutation(obj);
            }
            id v29 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            id v30 = [MEMORY[0x1E4F29128] TTZero];
            LOBYTE(v29) = [v29 isEqual:v30];

            if (v29)
            {
              int v43 = 0;
              goto LABEL_28;
            }
          }
          uint64_t v26 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }
      int v43 = 1;
LABEL_28:

      memset(v47, 0, sizeof(v47));
      int v48 = 1065353216;
      id v33 = [(ICTTMergeableString *)v13 attributedString];
      BOOL v34 = [v33 length] == 0;

      if (v34)
      {
        if (v43 && !v40)
        {
          [(ICTTMergeableString *)v13 updateClock];
          goto LABEL_33;
        }
        if (v43) {
          goto LABEL_33;
        }
      }
      else
      {
        int v35 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[ICTTMergeableString check:]();
        }

        int v43 = 0;
      }
      v36 = [(ICTTMergeableString *)v13 startNodes];
      v36[1] = *v36;
LABEL_33:
      if (a5 && &v53 != a5) {
        std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)a5, v53, (uint64_t)v54, (v54 - v53) >> 3);
      }
      std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v47);

      if (v53)
      {
        uint64_t v54 = v53;
        operator delete(v53);
      }

      if (!v43)
      {
        uint64_t v37 = 0;
LABEL_41:
        int v32 = v37;
        goto LABEL_42;
      }
LABEL_40:
      uint64_t v37 = v13;
      goto LABEL_41;
    }
  }
  uint64_t v31 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    -[ICTTMergeableString(ICTTMergeableStringPersistenceAdditions) initWithArchive:replicaID:orderedSubstrings:timestamp:fragment:]();
  }

  int v32 = 0;
LABEL_42:

  return v32;
}

- (void)startNodes
{
  return &self->_startNodes;
}

- (void)setTimestamp:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_timestamp, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ICTTMergeableString *)self invalidateCache];
    [(ICTTMergeableString *)self updateClock];
    unint64_t replicaTextClock = self->_replicaTextClock;
    unint64_t v6 = [(ICTTVectorMultiTimestamp *)self->_timestamp clockForUUID:self->_replicaUUID atIndex:0];
    if (replicaTextClock <= v6) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = replicaTextClock;
    }
    self->_unint64_t replicaTextClock = v7;
    unint64_t replicaStyleClock = self->_replicaStyleClock;
    unint64_t v9 = [(ICTTVectorMultiTimestamp *)self->_timestamp clockForUUID:self->_replicaUUID atIndex:1];
    if (replicaStyleClock <= v9) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = replicaStyleClock;
    }
    self->_unint64_t replicaStyleClock = v10;
  }
}

- (void)setAttributedString:(id)a3
{
}

- (void)endNodes
{
  return &self->_endNodes;
}

- (NSMutableAttributedString)attributedString
{
  return self->_attributedString;
}

- (NSHashTable)objectsNeedingUpdatedRanges
{
  return self->_objectsNeedingUpdatedRanges;
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (BOOL)hasLocalChanges
{
  return self->_hasLocalChanges;
}

- (id)characterRangesForSelection:(id)a3
{
  BOOL v3 = [(ICTTMergeableString *)self characterRangesForSelection:a3 selectedSubstringsBlock:0];
  return v3;
}

- (id)selectionForCharacterRanges:(id)a3
{
  BOOL v3 = [(ICTTMergeableString *)self selectionForCharacterRanges:a3 selectionAffinity:0];
  return v3;
}

- (id)selectionForCharacterRanges:(id)a3 selectionAffinity:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = objc_alloc_init(ICTTMergeableStringSelection);
  unint64_t v42 = a4;
  [(ICTTMergeableStringSelection *)v7 setSelectionAffinity:a4];
  if (![v6 count]) {
    goto LABEL_36;
  }
  uint64_t v8 = [(ICTTMergeableString *)self orderedSubstrings];
  unint64_t v9 = *v8;
  BOOL v40 = v8[1];
  if (*v8 == v40) {
    goto LABEL_36;
  }
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  BOOL v12 = 1;
  id v41 = v6;
  do
  {
    uint64_t v13 = *v9;
    if (*(unsigned char *)(*v9 + 44)) {
      goto LABEL_35;
    }
    int v43 = v9;
    while (1)
    {
      id v14 = [v6 objectAtIndexedSubscript:v11];
      uint64_t v15 = [v14 rangeValue];
      uint64_t v17 = v16;

      if (v12) {
        break;
      }
      int v22 = v15 + v17;
      if (v10 + (unint64_t)*(unsigned int *)(v13 + 16) <= v15 + v17 - 1)
      {
        BOOL v12 = 0;
        goto LABEL_33;
      }
      id v23 = *(id *)v13;
      int v24 = *(_DWORD *)(v13 + 8) + v22 + ~v10;
      uint64_t v25 = *(void *)([(ICTTMergeableStringSelection *)v7 selectionRanges] + 8);
      uint64_t v26 = *(void **)(v25 - 16);
      *(void *)(v25 - 16) = v23;
      id v27 = v23;

      *(_DWORD *)(v25 - 8) = v24;
      uint64_t v28 = 1;
      BOOL v12 = 1;
LABEL_29:

      unint64_t v9 = v43;
      v11 += v28;
      if (v11 >= [v6 count]) {
        goto LABEL_33;
      }
    }
    BOOL v12 = v17 == 0;
    if (v17 | v42) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = v15 == 0;
    }
    uint64_t v19 = !v18;
    if (v42 || v10 != v15)
    {
      BOOL v21 = 0;
      if (v42 == 1)
      {
        BOOL v20 = 0;
        if (v10 == v15)
        {
          BOOL v21 = 0;
          BOOL v20 = *(void *)(v13 + 56) == *(void *)(v13 + 48);
        }
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
      BOOL v21 = *(_DWORD *)(v13 + 72) == 0;
    }
    unint64_t v29 = v15 - v19;
    if (v10 + (unint64_t)*(unsigned int *)(v13 + 16) > v29 || v20 || v21)
    {
      id v30 = v7;
      id v31 = *(id *)v13;
      int v32 = *(_DWORD *)(v13 + 8);
      id v33 = [MEMORY[0x1E4F29128] TTZero];
      int v34 = v32 + v29 - v10;
      id v27 = v31;
      id v44 = v27;
      int v45 = v34;
      id v46 = v33;
      int v47 = 0;
      int v35 = [(ICTTMergeableStringSelection *)v30 selectionRanges];
      v36 = v35;
      unint64_t v37 = v35[1];
      if (v37 >= v35[2])
      {
        uint64_t v38 = std::vector<std::pair<TopoID,TopoID>>::__push_back_slow_path<std::pair<TopoID,TopoID> const&>(v35, (uint64_t)&v44);
      }
      else
      {
        *(void *)unint64_t v37 = v44;
        *(_DWORD *)(v37 + 8) = v45;
        *(void *)(v37 + 16) = v46;
        *(_DWORD *)(v37 + 24) = v47;
        uint64_t v38 = v37 + 32;
        v36[1] = v37 + 32;
      }
      unint64_t v7 = v30;
      uint64_t v28 = v17 == 0;
      v36[1] = v38;

      id v6 = v41;
      goto LABEL_29;
    }
    BOOL v12 = 1;
    id v6 = v41;
LABEL_33:
    if (v11 >= [v6 count]) {
      break;
    }
    v10 += *(unsigned int *)(v13 + 16);
LABEL_35:
    ++v9;
  }
  while (v9 != v40);
LABEL_36:

  return v7;
}

- (id)characterRangesForSelection:(id)a3 selectedSubstringsBlock:(id)a4
{
  id v41 = self;
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void, NSUInteger, NSUInteger))a4;
  int v45 = v6;
  uint64_t v8 = (void *)[v6 selectionRanges];
  if (v8[1] != *v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = [(ICTTMergeableString *)v41 orderedSubstrings];
    unint64_t v11 = *(void **)v10;
    unint64_t v42 = *(void **)(v10 + 8);
    if (*(void **)v10 == v42) {
      goto LABEL_50;
    }
    NSUInteger v12 = 0;
    unint64_t v13 = 0;
    id v44 = v9;
    char v14 = 1;
    while (1)
    {
      int v43 = v11;
      uint64_t v15 = *v11;
      while (1)
      {
        uint64_t v16 = v7;
        uint64_t v17 = *objc_msgSend(v45, "selectionRanges", v41) + 32 * v13;
        id v18 = *(id *)v17;
        unsigned int v19 = *(_DWORD *)(v17 + 8);
        id v20 = *(id *)(v17 + 16);
        BOOL v21 = v20;
        unsigned int v22 = *(_DWORD *)(v17 + 24);
        id v23 = *(id *)v15;
        if (v14) {
          break;
        }
        if (![v20 isEqual:v23]) {
          goto LABEL_37;
        }
        unsigned int v31 = *(_DWORD *)(v15 + 8);
        if (v22 < v31 || v22 >= *(_DWORD *)(v15 + 16) + v31) {
          goto LABEL_37;
        }
        if (*(unsigned char *)(v15 + 44)) {
          uint64_t v32 = 0;
        }
        else {
          uint64_t v32 = v22 - v31 + 1;
        }
        unint64_t v7 = v16;
        id v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v4, v12 + v32 - v4);
        [v44 addObject:v33];

        ++v13;
        if (v16) {
          v16[2](v16, v15, 0, v32);
        }
        char v14 = 1;
LABEL_35:

        int v34 = (void *)[v45 selectionRanges];
        if (v13 >= (uint64_t)(v34[1] - *v34) >> 5) {
          goto LABEL_38;
        }
      }
      int v24 = [v18 isEqual:v23];
      unsigned int v25 = *(_DWORD *)(v15 + 8);
      int v26 = v19 >= v25 ? v24 : 0;
      if (v26 == 1 && v19 < *(_DWORD *)(v15 + 16) + v25
        || v25 == v19 && [*(id *)v15 isEqual:v18])
      {
        break;
      }
LABEL_37:

      unint64_t v7 = v16;
LABEL_38:
      int v35 = (void *)[v45 selectionRanges];
      if (v13 < (uint64_t)(v35[1] - *v35) >> 5)
      {
        if (!((v7 == 0) | v14 & 1))
        {
          if (*(unsigned char *)(v15 + 44)) {
            NSUInteger v36 = 0;
          }
          else {
            NSUInteger v36 = *(unsigned int *)(v15 + 16);
          }
          NSUInteger v37 = *(unsigned int *)(v15 + 40);
          v48.length = [(ICTTMergeableString *)v41 length] - v4;
          v47.location = v37;
          v47.length = v36;
          v48.location = v4;
          NSRange v38 = NSIntersectionRange(v47, v48);
          v7[2](v7, v15, v38.location, v38.length);
        }
        uint64_t v39 = *(unsigned char *)(v15 + 44) ? 0 : *(unsigned int *)(v15 + 16);
        v12 += v39;
        unint64_t v11 = v43 + 1;
        if (v43 + 1 != v42) {
          continue;
        }
      }
      id v9 = v44;
      goto LABEL_50;
    }
    NSUInteger v4 = v12;
    if (!*(unsigned char *)(v15 + 44)) {
      NSUInteger v4 = v12 + v19 - *(_DWORD *)(v15 + 8);
    }
    id v27 = [MEMORY[0x1E4F29128] TTZero];
    int v28 = [v21 isEqual:v27];
    if (v22) {
      int v29 = 0;
    }
    else {
      int v29 = v28;
    }

    if (v29 == 1)
    {
      if (!*(unsigned char *)(v15 + 44) && ![v45 selectionAffinity] && *(_DWORD *)(v15 + 72)) {
        ++v4;
      }
      id v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v4, 0);
      [v44 addObject:v30];

      ++v13;
      char v14 = 1;
    }
    else
    {
      char v14 = 0;
    }
    unint64_t v7 = v16;
    goto LABEL_35;
  }
  id v9 = (id)MEMORY[0x1E4F1CBF0];
LABEL_50:

  return v9;
}

- (ICTTMergeableString)initWithData:(id)a3 replicaID:(id)a4
{
  return [(ICTTMergeableString *)self initWithData:a3 replicaID:a4 fragment:0];
}

- (void)updateAttributedStringAfterMerge
{
  BOOL v3 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
  NSUInteger v4 = [(ICTTMergeableString *)self orderedSubstrings];
  unint64_t v5 = (uint64_t *)*v4;
  id v6 = (uint64_t *)v4[1];
  while (v5 != v6)
  {
    uint64_t v7 = *v5;
    uint64_t v8 = [(NSMutableAttributedString *)v3 length];
    if (!*(unsigned char *)(v7 + 44)) {
      -[NSMutableAttributedString ic_appendAttributedSubstring:fromRange:](v3, "ic_appendAttributedSubstring:fromRange:", self->_attributedString, *(unsigned int *)(v7 + 40), *(unsigned int *)(v7 + 16));
    }
    *(_DWORD *)(v7 + 40) = ICTTBoundedCheckedCastNSUIntegerToUInt32(v8);
    ++v5;
  }
  attributedString = self->_attributedString;
  self->_attributedString = v3;
}

- (unint64_t)mergeWithString:(id)a3
{
  return [(ICTTMergeableString *)self mergeWithString:a3 mergeTimestamps:1];
}

- (void)dealloc
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x5812000000;
  uint64_t v16 = __Block_byref_object_copy__10;
  uint64_t v17 = __Block_byref_object_dispose__11;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v20 = 0;
  int v21 = 1065353216;
  begin = self->_startNodes.__begin_;
  end = self->_startNodes.__end_;
  if (begin == end)
  {
    uint64_t v7 = (void *)&v19 + 1;
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    do
    {
      uint64_t v6 = (uint64_t)*begin;
      v12[0] = v5;
      v12[1] = 3221225472;
      v12[2] = __30__ICTTMergeableString_dealloc__block_invoke;
      v12[3] = &unk_1E64A5350;
      v12[4] = &v13;
      traverseUnordered(v6, v12);
      ++begin;
    }
    while (begin != end);
    uint64_t v7 = v14 + 8;
  }
  uint64_t v8 = (void *)*v7;
  if (*v7)
  {
    do
    {
      uint64_t v9 = v8[2];
      if (v9)
      {
        uint64_t v10 = *(void **)(v9 + 48);
        if (v10)
        {
          *(void *)(v9 + 56) = v10;
          operator delete(v10);
        }

        MEMORY[0x1C877D640](v9, 0x1080C40D9F1C51ELL);
      }
      uint64_t v8 = (void *)*v8;
    }
    while (v8);
  }
  _Block_object_dispose(&v13, 8);
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v18 + 8);
  v11.receiver = self;
  v11.super_class = (Class)ICTTMergeableString;
  [(ICTTMergeableString *)&v11 dealloc];
}

- (BOOL)canMergeString:(id)a3
{
  id v4 = a3;
  if ([(ICTTMergeableString *)self isFragment])
  {
    BOOL v5 = 0;
  }
  else if ([v4 isFragment])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    int v28 = 1065353216;
    uint64_t v6 = [v4 startNodes];
    uint64_t v7 = *(id ***)v6;
    uint64_t v8 = *(id ***)(v6 + 8);
    while (v7 != v8)
    {
      uint64_t v9 = *v7;
      id v10 = **v7;
      uint64_t v11 = (*((_DWORD *)v9 + 2) + *((_DWORD *)v9 + 4) - 1);
      id v24 = v10;
      uint64_t v25 = v11;
      std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::__emplace_unique_key_args<TopoID,TopoID>((uint64_t)&v26, &v24, (uint64_t *)&v24);

      ++v7;
    }
    uint64_t v12 = [v4 endNodes];
    uint64_t v13 = *(uint64_t **)v12;
    char v14 = *(uint64_t **)(v12 + 8);
    while (v13 != v14)
    {
      std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::__emplace_unique_key_args<TopoID,TopoID const&>((uint64_t)&v26, (void *)*v13, *v13);
      ++v13;
    }
    uint64_t v15 = [(ICTTMergeableString *)self orderedSubstrings];
    uint64_t v16 = (id **)*v15;
    uint64_t v17 = (id **)v15[1];
LABEL_12:
    if (v16 != v17)
    {
      long long v18 = *v16;
      id v19 = **v16;
      int v20 = *((_DWORD *)v18 + 2);
      if (*((_DWORD *)v18 + 4) <= 1u) {
        int v21 = 1;
      }
      else {
        int v21 = *((_DWORD *)v18 + 4);
      }
      while (1)
      {
        id v22 = v19;
        id v24 = v22;
        LODWORD(v25) = v20;
        std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::__erase_unique<TopoID>(&v26, &v24);

        if (!*((void *)&v27 + 1)) {
          break;
        }
        ++v20;
        if (!--v21)
        {

          ++v16;
          goto LABEL_12;
        }
      }
    }
    BOOL v5 = *((void *)&v27 + 1) == 0;
    std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::~__hash_table((uint64_t)&v26);
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)isFragment
{
  begin = self->_startNodes.__begin_;
  if ((TopoSubstring **)((char *)self->_startNodes.__end_ - (char *)begin) != (TopoSubstring **)8
    || (TopoSubstring **)((char *)self->_endNodes.__end_ - (char *)self->_endNodes.__begin_) != (TopoSubstring **)8)
  {
    goto LABEL_9;
  }
  id v4 = *begin;
  BOOL v5 = [MEMORY[0x1E4F29128] TTZero];
  if (*((_DWORD *)v4 + 2)) {
    goto LABEL_4;
  }
  char v7 = [*(id *)v4 isEqual:v5];

  if ((v7 & 1) == 0)
  {
LABEL_9:
    LOBYTE(v6) = 1;
    return v6;
  }
  uint64_t v8 = *self->_endNodes.__begin_;
  BOOL v5 = [MEMORY[0x1E4F29128] TTZero];
  if (*((_DWORD *)v8 + 2) == -1)
  {
    int v6 = [*(id *)v8 isEqual:v5] ^ 1;
    goto LABEL_5;
  }
LABEL_4:
  LOBYTE(v6) = 1;
LABEL_5:

  return v6;
}

- (ICTTMergeableString)initWithData:(id)a3 replicaID:(id)a4 fragment:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  topotext::String::String((topotext::String *)v16);
  id v10 = v8;
  uint64_t v11 = (char *)[v10 bytes];
  int v12 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v10 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v16, v11, v12))
  {
    self = [(ICTTMergeableString *)self initWithArchive:v16 replicaID:v9 orderedSubstrings:0 timestamp:0 fragment:v5];
    uint64_t v13 = self;
  }
  else
  {
    char v14 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICTTMergeableString(ICTTMergeableStringPersistenceAdditions) initWithData:replicaID:fragment:]();
    }

    uint64_t v13 = 0;
  }
  topotext::String::~String((topotext::String *)v16);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_objectsNeedingUpdatedRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_replicaUUID, 0);
  objc_storeStrong(&self->_updateRangeBlock, 0);
  begin = self->_orderedSubstrings.__begin_;
  if (begin)
  {
    self->_orderedSubstrings.__end_ = begin;
    operator delete(begin);
  }
  id v4 = self->_endNodes.__begin_;
  if (v4)
  {
    self->_endNodes.__end_ = v4;
    operator delete(v4);
  }
  BOOL v5 = self->_startNodes.__begin_;
  if (v5)
  {
    self->_startNodes.__end_ = v5;
    operator delete(v5);
  }
}

- (void)sortSplitNodes
{
  minIdPath(*self->_startNodes.__begin_, (uint64_t)v3);
  id v2 = v3[0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  topotext::String::String((topotext::String *)v10);
  [(ICTTMergeableString *)self saveToArchive:v10];
  id v4 = [(ICTTMergeableString *)self timestamp];
  if ([v4 isDocumentShared])
  {
    BOOL v5 = [(ICTTMergeableString *)self timestamp];
  }
  else
  {
    BOOL v5 = 0;
  }

  id v6 = objc_alloc((Class)objc_opt_class());
  char v7 = [(ICTTMergeableString *)self replicaUUID];
  id v8 = (void *)[v6 initWithArchive:v10 replicaID:v7 timestamp:v5];

  topotext::String::~String((topotext::String *)v10);
  return v8;
}

+ (id)timestampFromData:(id)a3
{
  id v3 = a3;
  id v4 = [[ICTTVectorMultiTimestamp alloc] initWithData:v3 andCapacity:2];

  return v4;
}

- (void)setReplicaUUID:(id)a3
{
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];
  [(ICTTMergeableString *)self insertAttributedString:v6 atIndex:a4];
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
  -[ICTTMergeableString replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", location, length, v7);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v7 = [(ICTTMergeableString *)self delegate];
  id v8 = v7;
  if (v7) {
    [v7 beginEditing];
  }
  [(ICTTMergeableString *)self beginEditing];
  -[ICTTMergeableString deleteCharactersInRange:](self, "deleteCharactersInRange:", location, length);
  [(ICTTMergeableString *)self insertAttributedString:v9 atIndex:location];
  [(ICTTMergeableString *)self endEditing];
  if (v8) {
    [v8 endEditing];
  }
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    id v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    id v6 = operator new(0x10uLL);
    id v8 = v6 + 2;
    id v9 = v6 + 2;
    void *v6 = location;
    v6[1] = length;
    __p = v6;
    -[ICTTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &v10, location, length);
    [(ICTTMergeableString *)self deleteSubstrings:&v10 withCharacterRanges:&__p];
    if (__p)
    {
      id v8 = __p;
      operator delete(__p);
    }
    if (v10)
    {
      uint64_t v11 = v10;
      operator delete(v10);
    }
  }
}

- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (![v6 length]) {
    goto LABEL_16;
  }
  if (a4)
  {
    if ([(ICTTMergeableString *)self length] == a4)
    {
      id v7 = [(ICTTMergeableString *)self orderedSubstrings];
      id v8 = [(ICTTMergeableString *)self orderedSubstrings];
      id v9 = *(TopoSubstring **)(v8[1] - *v8 + *v7 - 16);
      begin = self->_endNodes.__begin_;
      goto LABEL_14;
    }
    uint64_t v12 = ICTTBoundedCheckedCastNSUIntegerToUInt32(a4);
    for (uint64_t i = 0; ; i += 8)
    {
      id v9 = *(TopoSubstring **)(*(void *)[(ICTTMergeableString *)self orderedSubstrings] + i);
      if (!*((unsigned char *)v9 + 44))
      {
        unsigned int v14 = *((_DWORD *)v9 + 4);
        BOOL v15 = v12 >= v14;
        uint64_t v16 = v12 - v14;
        if (!v15)
        {
          uint64_t v17 = [(ICTTMergeableString *)self splitTopoSubstring:v9 atIndex:v12];
          [(ICTTMergeableString *)self invalidateCache];
          goto LABEL_15;
        }
        uint64_t v12 = v16;
        if (!v16) {
          break;
        }
      }
    }
    uint64_t v11 = *(void *)[(ICTTMergeableString *)self orderedSubstrings] + i;
  }
  else
  {
    id v9 = *self->_startNodes.__begin_;
    uint64_t v11 = *(void *)[(ICTTMergeableString *)self orderedSubstrings];
  }
  begin = (TopoSubstring **)(v11 + 8);
LABEL_14:
  uint64_t v17 = *begin;
LABEL_15:
  [(ICTTMergeableString *)self insertAttributedString:v6 after:v9 before:v17];

LABEL_16:
}

- (void)beginEditing
{
}

- (void)endEditing
{
  unint64_t editCount = self->_editCount;
  if (editCount)
  {
    unint64_t v3 = editCount - 1;
    self->_unint64_t editCount = v3;
    if (!v3) {
      [(ICTTMergeableString *)self coalesce];
    }
  }
}

- (void)resetLocalReplicaClocksToTimestampValues
{
  self->_unint64_t replicaTextClock = [(ICTTVectorMultiTimestamp *)self->_timestamp clockForUUID:self->_replicaUUID atIndex:0];
  self->_unint64_t replicaStyleClock = [(ICTTVectorMultiTimestamp *)self->_timestamp clockForUUID:self->_replicaUUID atIndex:1];
}

- (void)_testSetTextTimestamp:(unint64_t)a3
{
  self->_unint64_t replicaTextClock = a3;
}

- (void)updateTimestampsInRange:(_NSRange)a3
{
  if (a3.length)
  {
    __p = 0;
    id v10 = 0;
    uint64_t v11 = 0;
    -[ICTTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &__p, a3.location, a3.length);
    id v4 = (uint64_t *)__p;
    BOOL v5 = v10;
    if (__p != v10)
    {
      do
      {
        uint64_t v6 = *v4;
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
        id v8 = *(void **)(v6 + 24);
        *(void *)(v6 + 24) = v7;

        ++v4;
      }
      while (v4 != v5);
    }
    [(ICTTMergeableString *)self coalesce];
    self->_hasLocalChanges = 1;
    if (__p)
    {
      id v10 = (uint64_t *)__p;
      operator delete(__p);
    }
  }
}

- (void)deleteSubstrings:(void *)a3 withCharacterRanges:(void *)a4
{
  uint64_t v6 = *(uint64_t **)a3;
  uint64_t v7 = (uint64_t *)*((void *)a3 + 1);
  if (*(uint64_t **)a3 != v7)
  {
    do
    {
      uint64_t v8 = *v6;
      if (!*(unsigned char *)(*v6 + 44))
      {
        *(unsigned char *)(v8 + 44) = 1;
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
        id v10 = *(void **)(v8 + 24);
        *(void *)(v8 + 24) = v9;
      }
      ++v6;
    }
    while (v6 != v7);
  }
  uint64_t v11 = (long long *)*((void *)a4 + 1);
  unint64_t v12 = 126 - 2 * __clz(((uint64_t)v11 - *(void *)a4) >> 4);
  if (v11 == *(long long **)a4) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }
  std::__introsort<std::_ClassicAlgPolicy,[(ICTTMergeableString *)*(void *)a4 deleteSubstrings:v13 withCharacterRanges:1];
  unsigned int v14 = *(uint64_t **)a4;
  BOOL v15 = (uint64_t *)*((void *)a4 + 1);
  while (v14 != v15)
  {
    uint64_t v16 = *v14;
    uint64_t v17 = v14[1];
    v14 += 2;
    -[NSMutableAttributedString deleteCharactersInRange:](self->_attributedString, "deleteCharactersInRange:", v16, v17);
  }
  long long v18 = [(ICTTMergeableString *)self delegate];
  id v25 = v18;
  if (v18)
  {
    [v18 beginEditing];
    int v20 = *(NSUInteger **)a4;
    id v19 = (NSUInteger *)*((void *)a4 + 1);
    if (v19 == *(NSUInteger **)a4) {
      goto LABEL_18;
    }
    uint64_t v21 = 0;
    NSUInteger location = *v20;
    v22.NSUInteger length = v20[1];
    do
    {
      v27.NSUInteger location = *v20;
      NSUInteger v24 = v20[1];
      v22.NSUInteger location = location;
      v27.NSUInteger length = v24;
      NSRange v22 = NSUnionRange(v22, v27);
      NSUInteger location = v22.location;
      v21 += v24;
      v20 += 2;
    }
    while (v20 != v19);
    objc_msgSend(v25, "edited:range:changeInLength:", 2, v22.location, v22.length, -v21);
  }
  [(ICTTMergeableString *)self coalesce];
  [(ICTTMergeableString *)self updateSubstringIndexes];
  self->_hasLocalChanges = 1;
  if (v25) {
    [v25 endEditing];
  }
LABEL_18:
}

- (TopoIDRange)insertAttributedString:(SEL)a3 after:(id)a4 before:(void *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x4812000000;
  uint64_t v13 = __Block_byref_object_copy__19;
  unsigned int v14 = __Block_byref_object_dispose__20;
  uint64_t v15 = 256;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  id v16 = 0;
  if ([v7 length]) {
    operator new();
  }
  uint64_t v8 = v11;
  retstr->var0.replicaID = (NSUUID *)(id)v11[6];
  retstr->var0.clock = *((_DWORD *)v8 + 14);
  retstr->var1 = *((_DWORD *)v8 + 16);
  _Block_object_dispose(&v10, 8);

  return result;
}

void __59__ICTTMergeableString_insertAttributedString_after_before___block_invoke(uint64_t a1, id *a2, id *a3)
{
  memset(v8, 0, sizeof(v8));
  updateTopoIDRange((TopoIDRange *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), a2, (uint64_t)a3, v8);
  uint64_t v6 = v8[0];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_storeStrong((id *)(v7 + 48), *(id *)v8[0]);
  *(_DWORD *)(v7 + 56) = *(_DWORD *)(v6 + 8);
  *(_DWORD *)(v7 + 64) = *(_DWORD *)(v6 + 16);
  uint64_t v9 = (void **)v8;
  std::vector<TopoIDRange>::__destroy_vector::operator()[abi:ne180100](&v9);
}

- (void)moveRange:(_NSRange)a3 toIndex:(unint64_t)a4
{
  if (a3.length)
  {
    __p = 0;
    BOOL v5 = 0;
    uint64_t v6 = 0;
    -[ICTTMergeableString getSubstrings:forCharacterRange:](self, "getSubstrings:forCharacterRange:", &__p, a3.location, a3.length);
    if (__p)
    {
      BOOL v5 = __p;
      operator delete(__p);
    }
  }
}

- (void)getSubstrings:(void *)a3 forCharacterRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v8 = [(ICTTMergeableString *)self orderedSubstrings];
  -[ICTTMergeableString getSubstrings:inOrderedSubstrings:forCharacterRange:](self, "getSubstrings:inOrderedSubstrings:forCharacterRange:", a3, v8, location, length);
}

- (void)getSubstrings:(void *)a3 inOrderedSubstrings:(void *)a4 forCharacterRange:(_NSRange)a5
{
  if (!a5.length) {
    return;
  }
  uint64_t v7 = *(char **)a4;
  if (*(void *)a4 == *((void *)a4 + 1)) {
    goto LABEL_47;
  }
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v11 = 0;
  NSUInteger v12 = a5.location + a5.length;
  uint64_t v57 = (char *)a3 + 16;
  while (1)
  {
    uint64_t v13 = *(void *)v7;
    if (*(unsigned char *)(*(void *)v7 + 44))
    {
      NSUInteger v14 = v11;
      goto LABEL_46;
    }
    NSUInteger v14 = v11 + *(unsigned int *)(v13 + 16);
    if (v14 <= location) {
      goto LABEL_46;
    }
    NSUInteger v15 = v12 - v11;
    if (v12 <= v11) {
      goto LABEL_47;
    }
    BOOL v16 = location >= v11;
    NSUInteger v17 = location - v11;
    if (v17 == 0 || !v16) {
      break;
    }
    id v59 = 0;
    id v59 = [(ICTTMergeableString *)self splitTopoSubstring:v13 atIndex:ICTTBoundedCheckedCastNSUIntegerToUInt32(v17)];
    uint64_t v7 = std::vector<TopoSubstring *>::insert((uint64_t)a4, v7 + 8, (char *)&v59);
    uint64_t v19 = (void *)*((void *)a3 + 1);
    unint64_t v18 = *((void *)a3 + 2);
    if ((unint64_t)v19 >= v18)
    {
      uint64_t v24 = ((uint64_t)v19 - *(void *)a3) >> 3;
      if ((unint64_t)(v24 + 1) >> 61) {
        goto LABEL_68;
      }
      uint64_t v25 = v18 - *(void *)a3;
      uint64_t v26 = v25 >> 2;
      if (v25 >> 2 <= (unint64_t)(v24 + 1)) {
        uint64_t v26 = v24 + 1;
      }
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v27 = v26;
      }
      if (v27) {
        int v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v27);
      }
      else {
        int v28 = 0;
      }
      int v34 = &v28[8 * v24];
      *(void *)int v34 = v59;
      uint64_t v20 = v34 + 8;
      NSUInteger v36 = *(char **)a3;
      int v35 = (char *)*((void *)a3 + 1);
      if (v35 != *(char **)a3)
      {
        do
        {
          uint64_t v37 = *((void *)v35 - 1);
          v35 -= 8;
          *((void *)v34 - 1) = v37;
          v34 -= 8;
        }
        while (v35 != v36);
        int v35 = *(char **)a3;
      }
      *(void *)a3 = v34;
      *((void *)a3 + 1) = v20;
      *((void *)a3 + 2) = &v28[8 * v27];
      if (v35) {
        operator delete(v35);
      }
    }
    else
    {
      void *v19 = v59;
      uint64_t v20 = v19 + 1;
    }
    *((void *)a3 + 1) = v20;
    if (v12 < v14)
    {
      uint64_t v58 = [(ICTTMergeableString *)self splitTopoSubstring:v59 atIndex:ICTTBoundedCheckedCastNSUIntegerToUInt32(length)];
      int v45 = v7 + 8;
      id v46 = &v58;
      goto LABEL_67;
    }
LABEL_46:
    v7 += 8;
    NSUInteger v11 = v14;
    if (v7 == *((char **)a4 + 1)) {
      goto LABEL_47;
    }
  }
  if (v14 <= v12)
  {
    NSRange v22 = (uint64_t *)*((void *)a3 + 1);
    unint64_t v21 = *((void *)a3 + 2);
    if ((unint64_t)v22 >= v21)
    {
      uint64_t v29 = ((uint64_t)v22 - *(void *)a3) >> 3;
      if ((unint64_t)(v29 + 1) >> 61) {
        goto LABEL_68;
      }
      uint64_t v30 = v21 - *(void *)a3;
      uint64_t v31 = v30 >> 2;
      if (v30 >> 2 <= (unint64_t)(v29 + 1)) {
        uint64_t v31 = v29 + 1;
      }
      if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v32 = v31;
      }
      if (v32) {
        id v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v32);
      }
      else {
        id v33 = 0;
      }
      NSRange v38 = &v33[8 * v29];
      *(void *)NSRange v38 = v13;
      id v23 = v38 + 8;
      BOOL v40 = *(char **)a3;
      uint64_t v39 = (char *)*((void *)a3 + 1);
      if (v39 != *(char **)a3)
      {
        do
        {
          uint64_t v41 = *((void *)v39 - 1);
          v39 -= 8;
          *((void *)v38 - 1) = v41;
          v38 -= 8;
        }
        while (v39 != v40);
        uint64_t v39 = *(char **)a3;
      }
      *(void *)a3 = v38;
      *((void *)a3 + 1) = v23;
      *((void *)a3 + 2) = &v33[8 * v32];
      if (v39) {
        operator delete(v39);
      }
    }
    else
    {
      *NSRange v22 = v13;
      id v23 = v22 + 1;
    }
    *((void *)a3 + 1) = v23;
    goto LABEL_46;
  }
  id v59 = [(ICTTMergeableString *)self splitTopoSubstring:v13 atIndex:ICTTBoundedCheckedCastNSUIntegerToUInt32(v15)];
  int v43 = (uint64_t *)*((void *)a3 + 1);
  unint64_t v42 = *((void *)a3 + 2);
  if ((unint64_t)v43 >= v42)
  {
    uint64_t v47 = ((uint64_t)v43 - *(void *)a3) >> 3;
    if ((unint64_t)(v47 + 1) >> 61) {
LABEL_68:
    }
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    uint64_t v48 = v42 - *(void *)a3;
    uint64_t v49 = v48 >> 2;
    if (v48 >> 2 <= (unint64_t)(v47 + 1)) {
      uint64_t v49 = v47 + 1;
    }
    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v50 = v49;
    }
    if (v50) {
      long long v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v57, v50);
    }
    else {
      long long v51 = 0;
    }
    long long v52 = &v51[8 * v47];
    v53 = &v51[8 * v50];
    *(void *)long long v52 = v13;
    id v44 = v52 + 8;
    uint64_t v55 = *(char **)a3;
    uint64_t v54 = (char *)*((void *)a3 + 1);
    if (v54 != *(char **)a3)
    {
      do
      {
        uint64_t v56 = *((void *)v54 - 1);
        v54 -= 8;
        *((void *)v52 - 1) = v56;
        v52 -= 8;
      }
      while (v54 != v55);
      uint64_t v54 = *(char **)a3;
    }
    *(void *)a3 = v52;
    *((void *)a3 + 1) = v44;
    *((void *)a3 + 2) = v53;
    if (v54) {
      operator delete(v54);
    }
  }
  else
  {
    *int v43 = v13;
    id v44 = v43 + 1;
  }
  *((void *)a3 + 1) = v44;
  int v45 = v7 + 8;
  id v46 = &v59;
LABEL_67:
  std::vector<TopoSubstring *>::insert((uint64_t)a4, v45, (char *)v46);
LABEL_47:
  if (!self->_addingAttributesForUniqueParagraphUUIDs) {
    [(ICTTMergeableString *)self invalidateCache];
  }
}

- (void)getSubstringBeforeTopoID:(TopoID)a3
{
  unsigned int clock = a3.clock;
  replicaID = a3.replicaID;
  uint64_t v6 = *self->_startNodes.__begin_;
  uint64_t v20 = a3.replicaID;
  uint64_t v7 = [(ICTTMergeableString *)self orderedSubstrings];
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (*v7 == v8)
  {
LABEL_13:
    uint64_t v6 = 0;
    goto LABEL_18;
  }
  uint64_t v19 = self;
  while (1)
  {
    uint64_t v10 = *v9;
    id v11 = **v9;
    unsigned int v12 = *((_DWORD *)v10 + 2);
    int v13 = *((_DWORD *)v10 + 4);
    if (![(NSUUID *)replicaID isEqual:v11]) {
      goto LABEL_10;
    }
    uint64_t v14 = clock - v12;
    if (clock == v12) {
      goto LABEL_17;
    }
    if (clock <= v12) {
      goto LABEL_10;
    }
    id v15 = v11;
    BOOL v16 = v15;
    if (v13 + v12 > clock) {
      break;
    }
    if (v13 + v12 == clock)
    {
      uint64_t v17 = [(NSUUID *)v20 TTCompare:v15];

      replicaID = v20;
      if (v17 == -1) {
        goto LABEL_15;
      }
    }
    else
    {

      replicaID = v20;
    }
LABEL_10:
    if (!*((unsigned char *)v10 + 44)) {
      uint64_t v6 = (TopoSubstring *)v10;
    }

    if (++v9 == v8) {
      goto LABEL_13;
    }
  }

  replicaID = v20;
LABEL_15:
  if (!*((unsigned char *)v10 + 44))
  {
    [(ICTTMergeableString *)v19 splitTopoSubstring:v10 atIndex:v14];
    [(ICTTMergeableString *)v19 invalidateCache];
    uint64_t v6 = (TopoSubstring *)v10;
  }
LABEL_17:

LABEL_18:
  return v6;
}

- (void)getSubstrings:(void *)a3 forTopoIDRange:(TopoIDRange *)a4
{
  if (!a4->var1) {
    goto LABEL_80;
  }
  uint64_t v6 = [(ICTTMergeableString *)self orderedSubstrings];
  uint64_t v7 = *v6;
  uint64_t v64 = v6[1];
  if (*v6 == v64) {
    goto LABEL_80;
  }
  char v62 = 0;
  v61 = (char *)a3 + 16;
  do
  {
    uint64_t v8 = *v7;
    id v9 = **v7;
    unsigned int v10 = *((_DWORD *)v8 + 2);
    int v11 = *((_DWORD *)v8 + 4);
    if (([(NSUUID *)a4->var0.replicaID isEqual:v9] & 1) == 0) {
      goto LABEL_69;
    }
    id v12 = v9;
    unint64_t v13 = v11 + v10;
    v65[0] = v12;
    v65[1] = (id)v13;
    if (TopoID::operator<=((uint64_t)v65, a4))
    {

      goto LABEL_69;
    }
    uint64_t v14 = (void **)a3;
    id v15 = a4->var0.replicaID;
    BOOL v16 = v15;
    unsigned int v17 = a4->var1 + a4->var0.clock;
    if (v10 == v17)
    {
      if ([v12 isEqual:v15]) {
        goto LABEL_13;
      }
      uint64_t v18 = [v12 TTCompare:v16];

      if (v18 == 1) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v10 > v17)
      {
LABEL_13:

LABEL_14:
        a3 = v14;
        goto LABEL_69;
      }
    }
    unsigned int clock = a4->var0.clock;
    if (clock > v10)
    {
      uint64_t v8 = [(ICTTMergeableString *)self splitTopoSubstring:v8 atIndex:clock - v10];
      uint64_t v20 = a4->var0.replicaID;
      unsigned int v21 = a4->var1 + a4->var0.clock;
      id v22 = v12;
      id v23 = v22;
      if (v21 < v13)
      {

LABEL_18:
        -[ICTTMergeableString splitTopoSubstring:atIndex:](self, "splitTopoSubstring:atIndex:", v8, a4->var1, v61);
        goto LABEL_40;
      }
      if (v21 == v13)
      {
        uint64_t v37 = [(NSUUID *)v20 TTCompare:v22];

        if (v37 == -1) {
          goto LABEL_18;
        }
      }
      else
      {
      }
LABEL_40:
      a3 = v14;
      uint64_t v30 = (id **)v14[1];
      unint64_t v41 = (unint64_t)v14[2];
      if ((unint64_t)v30 < v41)
      {
LABEL_41:
        *uint64_t v30 = v8;
        unint64_t v42 = v30 + 1;
LABEL_68:
        *((void *)a3 + 1) = v42;
        char v62 = 1;
        goto LABEL_69;
      }
      uint64_t v43 = ((char *)v30 - (unsigned char *)*v14) >> 3;
      if ((unint64_t)(v43 + 1) >> 61) {
        std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v44 = v41 - (void)*v14;
      uint64_t v45 = v44 >> 2;
      if (v44 >> 2 <= (unint64_t)(v43 + 1)) {
        uint64_t v45 = v43 + 1;
      }
      if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v34 = v45;
      }
      if (v34)
      {
        int v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v61, v34);
        a3 = v14;
      }
      else
      {
        int v35 = 0;
      }
      long long v51 = (id **)&v35[8 * v43];
      *long long v51 = v8;
      unint64_t v42 = v51 + 1;
      v53 = *(char **)a3;
      long long v52 = (char *)*((void *)a3 + 1);
      if (v52 != *(char **)a3)
      {
        do
        {
          uint64_t v54 = (id *)*((void *)v52 - 1);
          v52 -= 8;
          *--long long v51 = v54;
        }
        while (v52 != v53);
LABEL_65:
        long long v52 = *(char **)a3;
        goto LABEL_66;
      }
      goto LABEL_66;
    }
    id v24 = v12;
    uint64_t v25 = a4->var0.replicaID;
    uint64_t v26 = v25;
    unsigned int v27 = a4->var1 + a4->var0.clock;
    if (v13 > v27)
    {

LABEL_21:
      int v28 = a4->var0.replicaID;
      [(ICTTMergeableString *)self splitTopoSubstring:v8 atIndex:a4->var0.clock - v10 + a4->var1];
      a3 = v14;

      uint64_t v30 = (id **)v14[1];
      unint64_t v29 = (unint64_t)v14[2];
      if ((unint64_t)v30 < v29) {
        goto LABEL_41;
      }
      uint64_t v31 = ((char *)v30 - (unsigned char *)*v14) >> 3;
      if ((unint64_t)(v31 + 1) >> 61) {
        goto LABEL_81;
      }
      uint64_t v32 = v29 - (void)*v14;
      uint64_t v33 = v32 >> 2;
      if (v32 >> 2 <= (unint64_t)(v31 + 1)) {
        uint64_t v33 = v31 + 1;
      }
      if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v34 = v33;
      }
      if (v34) {
        int v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v61, v34);
      }
      else {
        int v35 = 0;
      }
      long long v51 = (id **)&v35[8 * v31];
      *long long v51 = v8;
      unint64_t v42 = v51 + 1;
      uint64_t v55 = (char *)*v14;
      long long v52 = (char *)v14[1];
      if (v52 != *v14)
      {
        do
        {
          uint64_t v56 = (id *)*((void *)v52 - 1);
          v52 -= 8;
          *--long long v51 = v56;
        }
        while (v52 != v55);
        goto LABEL_65;
      }
LABEL_66:
      *(void *)a3 = v51;
      *((void *)a3 + 1) = v42;
      *((void *)a3 + 2) = &v35[8 * v34];
      if (v52) {
        operator delete(v52);
      }
      goto LABEL_68;
    }
    if (v13 == v27)
    {
      uint64_t v36 = [v24 TTCompare:v25];

      if (v36 == 1) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    a3 = v14;
    uint64_t v39 = (id **)v14[1];
    unint64_t v38 = (unint64_t)v14[2];
    if ((unint64_t)v39 >= v38)
    {
      uint64_t v46 = ((char *)v39 - (unsigned char *)*v14) >> 3;
      if ((unint64_t)(v46 + 1) >> 61) {
LABEL_81:
      }
        std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
      uint64_t v47 = v38 - (void)*v14;
      uint64_t v48 = v47 >> 2;
      if (v47 >> 2 <= (unint64_t)(v46 + 1)) {
        uint64_t v48 = v46 + 1;
      }
      if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v49 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v49 = v48;
      }
      if (v49) {
        unint64_t v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v61, v49);
      }
      else {
        unint64_t v50 = 0;
      }
      uint64_t v57 = (id **)&v50[8 * v46];
      *uint64_t v57 = v8;
      BOOL v40 = v57 + 1;
      id v59 = (char *)*v14;
      uint64_t v58 = (char *)v14[1];
      if (v58 != *v14)
      {
        do
        {
          uint64_t v60 = (id *)*((void *)v58 - 1);
          v58 -= 8;
          *--uint64_t v57 = v60;
        }
        while (v58 != v59);
        uint64_t v58 = (char *)*v14;
      }
      *uint64_t v14 = v57;
      v14[1] = v40;
      v14[2] = &v50[8 * v49];
      if (v58) {
        operator delete(v58);
      }
    }
    else
    {
      *uint64_t v39 = v8;
      BOOL v40 = v39 + 1;
    }
    v14[1] = v40;
LABEL_69:

    ++v7;
  }
  while (v7 != v64);
  if (v62) {
    [(ICTTMergeableString *)self invalidateCache];
  }
LABEL_80:
}

- (void)getCharacterRanges:(void *)a3 forSubstrings:(void *)a4
{
  std::vector<_NSRange>::reserve((void **)a3, (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
  long long v28 = 0u;
  long long v29 = 0u;
  int v30 = 1065353216;
  uint64_t v7 = *(void **)a4;
  uint64_t v8 = (void *)*((void *)a4 + 1);
  while (v7 != v8)
  {
    std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)&v28, v7, v7);
    ++v7;
  }
  id v9 = [(ICTTMergeableString *)self orderedSubstrings];
  unsigned int v10 = *v9;
  int v11 = v9[1];
  if (*v9 != v11)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v27 = *v10;
      unint64_t v13 = std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v28, &v27);
      uint64_t v14 = v13;
      if (*(unsigned char *)(v27 + 44))
      {
        uint64_t v15 = 0;
        if (!v13) {
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v15 = *(unsigned int *)(v27 + 16);
        if (!v13) {
          goto LABEL_28;
        }
      }
      unsigned int v17 = (void *)*((void *)a3 + 1);
      unint64_t v16 = *((void *)a3 + 2);
      if ((unint64_t)v17 >= v16)
      {
        uint64_t v19 = *(void **)a3;
        uint64_t v20 = ((uint64_t)v17 - *(void *)a3) >> 4;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 60) {
          std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v22 = v16 - (void)v19;
        if (v22 >> 3 > v21) {
          unint64_t v21 = v22 >> 3;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          id v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)a3 + 16, v23);
          uint64_t v19 = *(void **)a3;
          unsigned int v17 = (void *)*((void *)a3 + 1);
        }
        else
        {
          id v24 = 0;
        }
        uint64_t v25 = &v24[16 * v20];
        *(void *)uint64_t v25 = v12;
        *((void *)v25 + 1) = v15;
        uint64_t v26 = v25;
        if (v17 != v19)
        {
          do
          {
            *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
            v26 -= 16;
            v17 -= 2;
          }
          while (v17 != v19);
          uint64_t v19 = *(void **)a3;
        }
        uint64_t v18 = v25 + 16;
        *(void *)a3 = v26;
        *((void *)a3 + 1) = v25 + 16;
        *((void *)a3 + 2) = &v24[16 * v23];
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        *unsigned int v17 = v12;
        v17[1] = v15;
        uint64_t v18 = v17 + 2;
      }
      *((void *)a3 + 1) = v18;
      if (*((void *)&v29 + 1) == 1) {
        break;
      }
      std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::erase(&v28, v14);
LABEL_28:
      v12 += v15;
      ++v10;
    }
    while (v10 != v11);
  }
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v28);
}

- (unint64_t)getCharacterIndexForCharID:(TopoID)a3
{
  unsigned int clock = a3.clock;
  replicaID = a3.replicaID;
  BOOL v5 = [(ICTTMergeableString *)self orderedSubstrings];
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  if (*v5 == v7)
  {
LABEL_18:
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = *v6;
      uint64_t v10 = *(unsigned char *)(*v6 + 44) ? 0 : *(unsigned int *)(v9 + 16);
      if (*(_DWORD *)(v9 + 8) == clock && ([*(id *)v9 isEqual:replicaID] & 1) != 0) {
        break;
      }
      if ([*(id *)v9 isEqual:replicaID])
      {
        unsigned int v11 = *(_DWORD *)(v9 + 8);
        if (v11 < clock || v11 == clock && [*(id *)v9 TTCompare:replicaID] == -1)
        {
          id v12 = *(id *)v9;
          unint64_t v13 = v12;
          unsigned int v14 = *(_DWORD *)(v9 + 16) + *(_DWORD *)(v9 + 8);
          if (v14 > clock)
          {

LABEL_21:
            unint64_t v8 = v8 + clock - *(unsigned int *)(v9 + 8);
            break;
          }
          if (v14 == clock)
          {
            uint64_t v15 = [(NSUUID *)replicaID TTCompare:v12];

            if (v15 == -1) {
              goto LABEL_21;
            }
          }
          else
          {
          }
        }
      }
      v8 += v10;
      if (++v6 == v7) {
        goto LABEL_18;
      }
    }
  }

  return v8;
}

- (void)enumerateSubstrings:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t, id *, id, void))a3;
  BOOL v5 = [(ICTTMergeableString *)self orderedSubstrings];
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  if (*v5 != v7)
  {
    do
    {
      uint64_t v8 = *v6;
      if (!*(unsigned char *)(*v6 + 44))
      {
        uint64_t v9 = *(unsigned int *)(v8 + 16);
        if (v9)
        {
          uint64_t v10 = *(unsigned int *)(v8 + 40);
          id v12 = *(id *)v8;
          int v11 = *(_DWORD *)(v8 + 16);
          int v13 = *(_DWORD *)(v8 + 8);
          int v14 = v11;
          v4[2](v4, v10, v9, &v12, *(id *)(v8 + 24), *(unsigned int *)(v8 + 32));
        }
      }
      ++v6;
    }
    while (v6 != v7);
  }
}

- (int64_t)substring:(void *)a3 modifiedAfter:(id)a4
{
  return [(ICTTMergeableString *)self substring:a3 modifiedAfter:a4 includeAttributes:1 replicaID:0];
}

- (int64_t)substring:(void *)a3 modifiedAfter:(id)a4 includeAttributes:(BOOL)a5 replicaID:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = *(id *)a3;
  uint64_t v11 = [v9 clockForUUID:v10 atIndex:0] - *((unsigned int *)a3 + 2);
  if (v11 >= *((unsigned int *)a3 + 4))
  {
    id v13 = *((id *)a3 + 3);
    if ([v9 clockForUUID:v13 atIndex:1] > *((unsigned int *)a3 + 8) || !v7)
    {
      int64_t v12 = -1;
    }
    else
    {
      int64_t v12 = 0;
      if (a6) {
        *a6 = v13;
      }
    }
  }
  else
  {
    if (a6) {
      *a6 = v10;
    }
    int64_t v12 = v11 & ~(v11 >> 63);
  }

  return v12;
}

- (void)enumerateHighlightableRangesModifiedAfter:(id)a3 includingAttributes:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  id v18 = a3;
  unsigned int v17 = (void (**)(id, int64_t, int64_t))a5;
  [(ICTTMergeableString *)self generateIdsForLocalChanges];
  uint64_t v8 = [(ICTTMergeableString *)self orderedSubstrings];
  id v10 = *v8;
  id v9 = v8[1];
  if (*v8 != v9)
  {
    do
    {
      uint64_t v11 = *v10;
      if (!*(unsigned char *)(*v10 + 44) && *(_DWORD *)(v11 + 16))
      {
        id v19 = 0;
        int64_t v12 = [(ICTTMergeableString *)self substring:v11 modifiedAfter:v18 includeAttributes:v6 replicaID:&v19];
        id v13 = v19;
        if ((v12 & 0x8000000000000000) == 0)
        {
          uint64_t v14 = *(unsigned int *)(v11 + 40);
          uint64_t v15 = [(ICTTMergeableString *)self replicaUUID];
          char v16 = [v13 isEqual:v15];

          if ((v16 & 1) == 0) {
            v17[2](v17, v12 + v14, *(unsigned int *)(v11 + 16) - v12);
          }
        }
      }
      ++v10;
    }
    while (v10 != v9);
  }
}

- (BOOL)textEitherSideOfSelectionAnchor:(TopoID)a3 wasModifiedAfter:(id)a4
{
  unsigned int clock = a3.clock;
  replicaID = a3.replicaID;
  id v7 = a4;
  uint64_t v8 = [(ICTTMergeableString *)self orderedSubstrings];
  id v9 = (void *)*v8;
  id v10 = (void *)v8[1];
  if ((void *)*v8 != v10)
  {
    char v11 = 0;
    int64_t v12 = 0;
    while (1)
    {
      id v13 = (void *)*v9;
      if (v11) {
        break;
      }
      if ([(NSUUID *)replicaID isEqual:*v13])
      {
        unsigned int v14 = *((_DWORD *)v13 + 2);
        if (v14 <= clock && *((_DWORD *)v13 + 4) + v14 > clock)
        {
          if (*((unsigned char *)v13 + 44)) {
            BOOL v15 = v12 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15
            && ([(ICTTMergeableString *)self substring:v12 modifiedAfter:v7] & 0x8000000000000000) == 0
            || (unint64_t v16 = [(ICTTMergeableString *)self substring:v13 modifiedAfter:v7],
                (v16 & 0x8000000000000000) == 0)
            && v16 <= clock - *((_DWORD *)v13 + 2))
          {
LABEL_32:
            BOOL v19 = 1;
            goto LABEL_31;
          }
          id v17 = (id)*v13;
          int v18 = *((_DWORD *)v13 + 2) + *((_DWORD *)v13 + 4) - 1;

          if (v18 != clock) {
            goto LABEL_30;
          }
          goto LABEL_7;
        }
      }
      if (!*((_DWORD *)v13 + 4)
        && *((_DWORD *)v13 + 2) == clock
        && ([(id)*v13 isEqual:replicaID] & 1) != 0)
      {
        goto LABEL_7;
      }
      if (!*((unsigned char *)v13 + 44)
        || ([(ICTTMergeableString *)self substring:v13 modifiedAfter:v7] & 0x8000000000000000) == 0)
      {
        char v11 = 0;
        goto LABEL_27;
      }
      char v11 = 0;
LABEL_8:
      id v13 = v12;
LABEL_27:
      ++v9;
      int64_t v12 = v13;
      if (v9 == v10) {
        goto LABEL_30;
      }
    }
    if (![(ICTTMergeableString *)self substring:*v9 modifiedAfter:v7]
      && *((_DWORD *)v13 + 4))
    {
      goto LABEL_32;
    }
    if (!*((unsigned char *)v13 + 44)) {
      goto LABEL_30;
    }
LABEL_7:
    char v11 = 1;
    goto LABEL_8;
  }
LABEL_30:
  BOOL v19 = 0;
LABEL_31:

  return v19;
}

- (BOOL)selection:(id)a3 wasModifiedAfter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ICTTMergeableString *)self generateIdsForLocalChanges];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v8 = (void *)[v6 selectionRanges];
  if (v8[1] == *v8)
  {
    LOBYTE(self) = 0;
  }
  else
  {
    id v9 = (void *)[v6 selectionRanges];
    if (v9[1] - *v9 != 32)
    {
LABEL_9:
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __50__ICTTMergeableString_selection_wasModifiedAfter___block_invoke;
      v22[3] = &unk_1E64A53C8;
      v22[4] = self;
      id v23 = v7;
      id v24 = &v25;
      id v20 = [(ICTTMergeableString *)self characterRangesForSelection:v6 selectedSubstringsBlock:v22];
      LOBYTE(self) = *((unsigned char *)v26 + 24) != 0;

      goto LABEL_10;
    }
    uint64_t v10 = *(void *)[v6 selectionRanges];
    char v11 = [MEMORY[0x1E4F29128] TTZero];
    int64_t v12 = v11;
    if (*(_DWORD *)(v10 + 24))
    {

      goto LABEL_9;
    }
    int v13 = [*(id *)(v10 + 16) isEqual:v11];

    if (!v13) {
      goto LABEL_9;
    }
    unsigned int v14 = (id **)[v6 selectionRanges];
    BOOL v15 = *v14;
    id v16 = **v14;
    uint64_t v17 = *((unsigned int *)v15 + 2);
    id v18 = v16;
    BOOL v19 = v18;
    if (self) {
      LOBYTE(self) = -[ICTTMergeableString textEitherSideOfSelectionAnchor:wasModifiedAfter:](self, "textEitherSideOfSelectionAnchor:wasModifiedAfter:", v18, v17, v7);
    }
    else {
  }
    }
LABEL_10:
  _Block_object_dispose(&v25, 8);

  return (char)self;
}

NSUInteger __50__ICTTMergeableString_selection_wasModifiedAfter___block_invoke(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4)
{
  NSUInteger result = [*(id *)(a1 + 32) substring:a2 modifiedAfter:*(void *)(a1 + 40)];
  if ((result & 0x8000000000000000) == 0)
  {
    if (*(unsigned char *)(a2 + 44)
      || (v10.NSUInteger length = *(unsigned int *)(a2 + 16) - result,
          v10.NSUInteger location = result + *(unsigned int *)(a2 + 40),
          v11.NSUInteger location = a3,
          v11.NSUInteger length = a4,
          NSRange v9 = NSIntersectionRange(v10, v11),
          NSUInteger result = v9.location,
          v9.length))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)splitTopoSubstring:(void *)a3 atIndex:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v6 = *(id *)a3;
  *((_DWORD *)a3 + 4) = a4;
  operator new();
}

- (void)updateSubstringIndexes
{
  id v2 = [(ICTTMergeableString *)self orderedSubstrings];
  unint64_t v3 = *v2;
  id v4 = v2[1];
  if (*v2 != v4)
  {
    int v5 = 0;
    do
    {
      uint64_t v6 = *v3;
      *(_DWORD *)(v6 + 40) = v5;
      if (!*(unsigned char *)(v6 + 44)) {
        v5 += *(_DWORD *)(v6 + 16);
      }
      ++v3;
    }
    while (v3 != v4);
  }
}

- (void)coalesce
{
  if (!self->_editCount && ![(ICTTMergeableString *)self isFragment])
  {
    unint64_t v3 = *self->_startNodes.__begin_;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    int v49 = 0;
    uint64_t v40 = 0;
    unint64_t v41 = &v40;
    uint64_t v42 = 0x5812000000;
    uint64_t v43 = __Block_byref_object_copy__10;
    memset(v45, 0, sizeof(v45));
    uint64_t v44 = __Block_byref_object_dispose__11;
    uint64_t v46 = 0;
    int v47 = 1065353216;
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x5812000000;
    int v35 = __Block_byref_object_copy__10;
    memset(v37, 0, sizeof(v37));
    uint64_t v36 = __Block_byref_object_dispose__11;
    uint64_t v38 = 0;
    int v39 = 1065353216;
    id v4 = [MEMORY[0x1E4F29128] UUID];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __31__ICTTMergeableString_coalesce__block_invoke;
    v25[3] = &unk_1E64A5418;
    uint64_t v31 = v3;
    char v28 = &v32;
    id v5 = v4;
    id v26 = v5;
    uint64_t v27 = self;
    long long v29 = v48;
    int v30 = &v40;
    [(ICTTMergeableString *)self traverseUnordered:v25];
    for (uint64_t i = (void *)v41[8]; i; uint64_t i = (void *)*i)
    {
      uint64_t v7 = i[2];
      id v8 = *(id *)v7;
      int v9 = *(_DWORD *)(v7 + 8);
      int v10 = *(_DWORD *)(v7 + 16);
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
      unsigned int unserializedClock = self->_unserializedClock;
      id v13 = *(id *)v7;
      *(void *)uint64_t v7 = v11;

      *(_DWORD *)(v7 + 8) = unserializedClock;
      self->_unserializedClock += *(_DWORD *)(v7 + 16);
      id v14 = v8;
      id v22 = v14;
      int v23 = v9;
      int v24 = v10;
      id v19 = *(id *)v7;
      int v15 = *(_DWORD *)(v7 + 16);
      int v20 = *(_DWORD *)(v7 + 8);
      int v21 = v15;
      [(ICTTMergeableString *)self updateTopoIDRange:&v22 toNewRangeID:&v19];
    }
    for (j = (void *)v33[8]; j; j = (void *)*j)
    {
      uint64_t v17 = j[2];
      if (v17)
      {
        id v18 = *(void **)(v17 + 48);
        if (v18)
        {
          *(void *)(v17 + 56) = v18;
          operator delete(v18);
        }

        MEMORY[0x1C877D640](v17, 0x1080C40D9F1C51ELL);
      }
    }
    [(ICTTMergeableString *)self invalidateCache];

    _Block_object_dispose(&v32, 8);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v37[8]);
    _Block_object_dispose(&v40, 8);
    std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v45[8]);
    _Block_object_dispose(v48, 8);
  }
}

void __31__ICTTMergeableString_coalesce__block_invoke(void *a1, uint64_t a2)
{
  uint64_t v47 = a2;
  if (a1[9] != a2)
  {
    uint64_t v2 = a2;
    unint64_t v3 = *(uint64_t **)(a2 + 48);
    if (*(void *)(a2 + 56) - (void)v3 == 8)
    {
      unint64_t v5 = 0x1E4F29000uLL;
      do
      {
        uint64_t v46 = 0;
        uint64_t v6 = *v3;
        uint64_t v46 = v6;
        if (*(_DWORD *)(v6 + 72) != 1 || *(unsigned __int8 *)(v2 + 44) != *(unsigned __int8 *)(v6 + 44)) {
          return;
        }
        if ([*(id *)v2 isEqual:*(void *)v6])
        {
          uint64_t v7 = v47;
          if (*(_DWORD *)(v2 + 16) + *(_DWORD *)(v2 + 8) == *(_DWORD *)(v6 + 8)
            && *(_DWORD *)(v47 + 32) == *(_DWORD *)(v46 + 32))
          {
            int v8 = [*(id *)(v47 + 24) isEqual:*(void *)(v46 + 24)];
            uint64_t v7 = v47;
            if (v8)
            {
              uint64_t v9 = v47;
              if (v47 != v46)
              {
                std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v47 + 48), *(char **)(v46 + 48), *(void *)(v46 + 56), (uint64_t)(*(void *)(v46 + 56) - *(void *)(v46 + 48)) >> 3);
                uint64_t v9 = v46;
                uint64_t v7 = v47;
              }
              *(_DWORD *)(v7 + 16) += *(_DWORD *)(v9 + 16);
              std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(void *)(a1[6] + 8) + 48, &v46, &v46);
              goto LABEL_27;
            }
          }
        }
        else
        {
          uint64_t v7 = v47;
        }
        int v10 = *(void **)v7;
        uint64_t v11 = objc_msgSend(*(id *)(v5 + 296), "CR_unserialized", v34, v35, v36);
        if (v10 != (void *)v11)
        {
          int v10 = (void *)v11;
          goto LABEL_32;
        }
        id v12 = *(id *)v46;
        uint64_t v13 = objc_msgSend(*(id *)(v5 + 296), "CR_unserialized");
        if (v12 != (id)v13)
        {
          id v12 = (id)v13;
LABEL_31:

LABEL_32:
          return;
        }
        if (*(_DWORD *)(v47 + 32) != *(_DWORD *)(v46 + 32)) {
          goto LABEL_31;
        }
        int v14 = [*(id *)(v47 + 24) isEqual:*(void *)(v46 + 24)];

        if (!v14) {
          return;
        }
        uint64_t v15 = v47;
        id v16 = *(id *)v47;
        int v17 = *(_DWORD *)(v15 + 8);
        int v18 = *(_DWORD *)(v15 + 16);
        if (v47 != v46) {
          std::vector<TopoSubstring *>::__assign_with_size[abi:ne180100]<TopoSubstring * const*,TopoSubstring * const*>((char *)(v47 + 48), *(char **)(v46 + 48), *(void *)(v46 + 56), (uint64_t)(*(void *)(v46 + 56) - *(void *)(v46 + 48)) >> 3);
        }
        id v19 = (void *)a1[4];
        id v20 = v19;
        int v21 = *(_DWORD *)(*(void *)(a1[7] + 8) + 24);
        uint64_t v22 = v47;
        int v23 = *(_DWORD *)(v47 + 16);
        id v24 = v20;
        int v25 = *(_DWORD *)(v46 + 16) + *(_DWORD *)(v22 + 16);
        objc_storeStrong((id *)v22, v19);
        *(_DWORD *)(v22 + 8) = v21;
        *(_DWORD *)(v22 + 16) = v25;
        *(_DWORD *)(*(void *)(a1[7] + 8) + 24) += *(_DWORD *)(v47 + 16);
        id v26 = (void *)a1[5];
        id v27 = v16;
        id v43 = v27;
        int v44 = v17;
        int v45 = v18;
        id v28 = v24;
        id v40 = v28;
        int v41 = v21;
        int v42 = v18;
        if (v26)
        {
          [v26 updateTopoIDRange:&v43 toNewRangeID:&v40];
        }
        else
        {
        }
        long long v29 = (void *)a1[5];
        uint64_t v30 = v46;
        id v37 = *(id *)v46;
        int v31 = *(_DWORD *)(v30 + 16);
        int v38 = *(_DWORD *)(v30 + 8);
        int v39 = v31;
        id v32 = v28;
        id v34 = v32;
        int v33 = *(_DWORD *)(v46 + 16);
        LODWORD(v35) = v23 + v21;
        LODWORD(v36) = v33;
        if (v29)
        {
          [v29 updateTopoIDRange:&v37 toNewRangeID:&v34];
        }
        else
        {
        }
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(void *)(a1[8] + 8) + 48, &v47, &v47);
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>(*(void *)(a1[6] + 8) + 48, &v46, &v46);
        *(unsigned char *)(a1[5] + 120) = 1;

        unint64_t v5 = 0x1E4F29000;
LABEL_27:
        uint64_t v2 = v47;
        unint64_t v3 = *(uint64_t **)(v47 + 48);
      }
      while (*(void *)(v47 + 56) - (void)v3 == 8);
    }
  }
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = [(ICTTMergeableString *)self objectsNeedingUpdatedRanges];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v26 = a3->var0.replicaID;
        unsigned int var1 = a3->var1;
        unsigned int clock = a3->var0.clock;
        unsigned int v28 = var1;
        int v23 = a4->var0.replicaID;
        unsigned int v13 = a4->var1;
        unsigned int v24 = a4->var0.clock;
        unsigned int v25 = v13;
        if (v11)
        {
          [v11 updateTopoIDRange:&v26 toNewRangeID:&v23];
        }
        else
        {
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  updateRangeBlock = (void (**)(id, NSUUID **, NSUUID **))self->_updateRangeBlock;
  if (updateRangeBlock)
  {
    id v20 = a3->var0.replicaID;
    unsigned int v15 = a3->var1;
    unsigned int v21 = a3->var0.clock;
    unsigned int v22 = v15;
    int v17 = a4->var0.replicaID;
    unsigned int v16 = a4->var1;
    unsigned int v18 = a4->var0.clock;
    unsigned int v19 = v16;
    updateRangeBlock[2](updateRangeBlock, &v20, &v17);
  }
}

- (void)cleanupObjectsNeedingUpdatedRanges
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:5];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(ICTTMergeableString *)self objectsNeedingUpdatedRanges];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v8 hasTopoIDsThatCanChange] & 1) == 0) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [(ICTTMergeableString *)self objectsNeedingUpdatedRanges];
  [v9 minusHashTable:v3];
}

- (void)dumpData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 128);
  int v4 = 134218498;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Dumping mergeable string data: %p %@ %@", (uint8_t *)&v4, 0x20u);
}

- (void)dumpMergeData:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v4 = (id *)a3;
  uint64_t v5 = [(NSMutableAttributedString *)self->_attributedString mutableCopy];
  uint64_t v6 = [v4[20] mutableCopy];
  uint32_t v7 = arc4random();
  uint64_t v34 = (void *)v6;
  uint64_t v35 = (NSMutableAttributedString *)v5;
  uint64_t v36 = v4;
  uint64_t v8 = [(NSMutableAttributedString *)self->_attributedString length];
  if (v8)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = [(NSMutableAttributedString *)self->_attributedString mutableString];
      long long v11 = NSString;
      long long v12 = [(NSMutableAttributedString *)self->_attributedString mutableString];
      long long v13 = objc_msgSend(v11, "stringWithFormat:", @"%c", (v7 ^ objc_msgSend(v12, "characterAtIndex:", v9)) % 0x5E + 32);
      objc_msgSend(v10, "replaceCharactersInRange:withString:", v9, 1, v13);

      ++v9;
    }
    while (v8 != v9);
  }
  int v14 = v36;
  uint64_t v15 = [v36[20] length];
  if (v15)
  {
    uint64_t v16 = 0;
    do
    {
      int v17 = [v14[20] mutableString];
      unsigned int v18 = NSString;
      unsigned int v19 = [v14[20] mutableString];
      id v20 = objc_msgSend(v18, "stringWithFormat:", @"%c", (v7 ^ objc_msgSend(v19, "characterAtIndex:", v16)) % 0x5E + 32);
      objc_msgSend(v17, "replaceCharactersInRange:withString:", v16, 1, v20);

      ++v16;
      int v14 = v36;
    }
    while (v15 != v16);
  }
  unsigned int v21 = [(ICTTMergeableString *)self serialize];
  unsigned int v22 = [v14 serialize];
  int v23 = NSTemporaryDirectory();
  unsigned int v24 = objc_msgSend(NSString, "stringWithFormat:", @"mergeA-%p.data", self);
  unsigned int v25 = [v23 stringByAppendingPathComponent:v24];

  id v26 = NSTemporaryDirectory();
  id v27 = objc_msgSend(NSString, "stringWithFormat:", @"mergeB-%p.data", self);
  unsigned int v28 = [v26 stringByAppendingPathComponent:v27];

  [v21 writeToFile:v25 atomically:1];
  [v22 writeToFile:v28 atomically:1];
  long long v29 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    replicaUUID = self->_replicaUUID;
    *(_DWORD *)uint8_t buf = 134218754;
    int v38 = self;
    __int16 v39 = 2112;
    id v40 = replicaUUID;
    __int16 v41 = 2112;
    int v42 = v25;
    __int16 v43 = 2112;
    int v44 = v28;
    _os_log_error_impl(&dword_1C3A61000, v29, OS_LOG_TYPE_ERROR, "Dumping merge: %p %@ %@ %@", buf, 0x2Au);
  }

  attributedString = self->_attributedString;
  self->_attributedString = v35;
  long long v31 = v35;

  id v32 = v14[20];
  v14[20] = v34;
}

void __55__ICTTMergeableString_mergeWithString_mergeTimestamps___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 72) = 0;
}

void __55__ICTTMergeableString_mergeWithString_mergeTimestamps___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)(a2 + 48);
  uint64_t v3 = *(uint64_t **)(a2 + 56);
  while (v2 != v3)
  {
    uint64_t v4 = *v2++;
    ++*(_DWORD *)(v4 + 72);
  }
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ICTTMergeableString *)self string];
  uint32_t v7 = [v3 stringWithFormat:@"<%@ %p = '%@'>", v5, self, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  attributedString = self->_attributedString;
  uint64_t v6 = [v4 attributedString];
  LOBYTE(attributedString) = [(NSMutableAttributedString *)attributedString isEqual:v6];

  BOOL v7 = (attributedString & 1) != 0 && [(ICTTMergeableString *)self graphIsEqual:v4];
  return v7;
}

- (BOOL)graphIsEqual:(id)a3
{
  id v4 = a3;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  uint64_t v21 = 0;
  unsigned int v22 = &v21;
  uint64_t v23 = 0x5812000000;
  unsigned int v24 = __Block_byref_object_copy__93;
  memset(v26, 0, sizeof(v26));
  unsigned int v25 = __Block_byref_object_dispose__94;
  uint64_t v27 = 0;
  int v28 = 1065353216;
  [(ICTTMergeableString *)self coalesce];
  [v4 coalesce];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __36__ICTTMergeableString_graphIsEqual___block_invoke;
  v20[3] = &unk_1E64A5350;
  v20[4] = &v21;
  [(ICTTMergeableString *)self traverseUnordered:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __36__ICTTMergeableString_graphIsEqual___block_invoke_2;
  v19[3] = &unk_1E64A5328;
  v19[4] = &v21;
  v19[5] = &v29;
  [v4 traverseUnordered:v19];
  if (*((unsigned char *)v30 + 24))
  {
    uint64_t v5 = (uint64_t **)v22[8];
    if (v5)
    {
      while (1)
      {
        uint64_t v6 = v5[2];
        BOOL v7 = v5[4];
        uint64_t v8 = v5[5];
        if (!v7 || v8 == 0) {
          break;
        }
        uint64_t v11 = v7[6];
        uint64_t v10 = v7[7];
        unint64_t v12 = (v10 - v11) >> 3;
        if (v12 != (v8[7] - v8[6]) >> 3) {
          break;
        }
        if (v10 != v11)
        {
          uint64_t v13 = 0;
          if (v12 <= 1) {
            uint64_t v14 = 1;
          }
          else {
            uint64_t v14 = (v10 - v11) >> 3;
          }
          while (1)
          {
            uint64_t v15 = *(void *)(v7[6] + 8 * v13);
            uint64_t v16 = *(void *)(v8[6] + 8 * v13);
            if (*(_DWORD *)(v15 + 8) != *(_DWORD *)(v16 + 8)
              || ([*(id *)v15 isEqual:*(void *)v16] & 1) == 0)
            {
              break;
            }
            if (v14 == ++v13) {
              goto LABEL_17;
            }
          }
          *((unsigned char *)v30 + 24) = 0;
        }
LABEL_17:
        if (!*((unsigned char *)v30 + 24)) {
          goto LABEL_21;
        }

        uint64_t v5 = (uint64_t **)*v5;
        if (!v5) {
          goto LABEL_22;
        }
      }
      *((unsigned char *)v30 + 24) = 0;
LABEL_21:
    }
  }
LABEL_22:
  char v17 = *((unsigned char *)v30 + 24);
  _Block_object_dispose(&v21, 8);
  std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::~__hash_table((uint64_t)&v26[8]);
  _Block_object_dispose(&v29, 8);

  return v17;
}

void *__36__ICTTMergeableString_graphIsEqual___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8) + 48;
  BOOL v7 = a2;
  *((void *)std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>(v4, a2, (uint64_t)&std::piecewise_construct, (uint64_t *)&v7)+ 4) = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8) + 48;
  BOOL v7 = a2;
  NSUInteger result = std::__hash_table<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::__unordered_map_hasher<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::hash<TopoID>,std::equal_to<TopoID>,true>,std::__unordered_map_equal<TopoID,std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>,std::equal_to<TopoID>,std::hash<TopoID>,true>,std::allocator<std::__hash_value_type<TopoID,std::pair<TopoSubstring *,TopoSubstring *>>>>::__emplace_unique_key_args<TopoID,std::piecewise_construct_t const&,std::tuple<TopoID const&>,std::tuple<>>(v5, a2, (uint64_t)&std::piecewise_construct, (uint64_t *)&v7);
  result[5] = 0;
  return result;
}

uint64_t *__36__ICTTMergeableString_graphIsEqual___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  NSUInteger result = std::__hash_table<TopoID,std::hash<TopoID>,std::equal_to<TopoID>,std::allocator<TopoID>>::find<TopoID>((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), (void *)a2);
  if (result
    && (BOOL v7 = result, v8 = result[4], *(_DWORD *)(a2 + 32) == *(_DWORD *)(v8 + 32))
    && (NSUInteger result = (uint64_t *)[*(id *)(a2 + 24) isEqual:*(void *)(v8 + 24)],
        (result & 1) != 0))
  {
    v7[5] = a2;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v2 = [(ICTTMergeableString *)self attributedString];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)dotDescription:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v5, "appendFormat:", @"subgraph cluster_%ld%p_%ld {\n  rankdir=\"LR\";\n", a3, self, a3);
  if ([(ICTTMergeableString *)self isFragment])
  {
    uint64_t v6 = @"<Fragment>";
  }
  else
  {
    BOOL v7 = [(ICTTMergeableString *)self string];
    uint64_t v8 = [v7 string];
    uint64_t v6 = [v8 description];
  }
  uint64_t v9 = [(__CFString *)v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

  uint64_t v10 = [(ICTTMergeableString *)self replicaUUID];
  char v32 = (void *)v9;
  uint64_t v11 = [v10 TTShortDescription];
  [v5 appendFormat:@"  label=\"%@_%ld (%ld)    '%@'\"\n", v11, a3, -[ICTTVectorMultiTimestamp clockForUUID:atIndex:](self->_timestamp, "clockForUUID:atIndex:", self->_replicaUUID, 0), v9];

  [v5 appendFormat:@"  color=lightgrey;\n"];
  unint64_t v12 = [(ICTTMergeableString *)self orderedSubstrings];
  uint64_t v13 = *v12;
  uint64_t v34 = v12[1];
  if (*v12 != v34)
  {
    int v33 = self;
    while (1)
    {
      uint64_t v14 = *v13;
      begin = self->_startNodes.__begin_;
      end = self->_startNodes.__end_;
      if (begin != end)
      {
        while (*begin != (TopoSubstring *)v14)
        {
          if (++begin == end)
          {
            begin = self->_startNodes.__end_;
            break;
          }
        }
      }
      if (begin != end) {
        break;
      }
      unsigned int v22 = self->_endNodes.__begin_;
      uint64_t v21 = self->_endNodes.__end_;
      if (v22 != v21)
      {
        while (*v22 != (TopoSubstring *)v14)
        {
          if (++v22 == v21)
          {
            unsigned int v22 = self->_endNodes.__end_;
            break;
          }
        }
      }
      if (v22 == v21)
      {
        char v17 = &stru_1F1F2FFF8;
        if (!*(unsigned char *)(v14 + 44))
        {
          unsigned int v25 = [(NSMutableAttributedString *)self->_attributedString string];
          id v26 = v25;
          if (*(unsigned char *)(v14 + 44)) {
            uint64_t v27 = 0;
          }
          else {
            uint64_t v27 = *(unsigned int *)(v14 + 16);
          }
          objc_msgSend(v25, "substringWithRange:", *(unsigned int *)(v14 + 40), v27);
          char v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        id v20 = [*(id *)v14 TTShortDescription];
        uint64_t v28 = *(unsigned int *)(v14 + 8);
        int v29 = *(_DWORD *)(v14 + 16);
        long long v30 = [*(id *)(v14 + 24) TTShortDescription];
        objc_msgSend(v5, "appendFormat:", @"  N%ld%p [label=\"%@ %@,%d-%u (%@,%d)\"];\n",
          a3,
          v14,
          v17,
          v20,
          v28,
          (v28 + v29 - 1),
          v30,
          *(unsigned int *)(v14 + 32));

        goto LABEL_12;
      }
      char v17 = [*(id *)v14 TTShortDescription];
      objc_msgSend(v5, "appendFormat:", @"  N%ld%p [label=\"End\\n%@,%d\"];\n",
        a3,
        v14,
        v17,
        *(unsigned int *)(v14 + 8));
LABEL_19:

      uint64_t v23 = *(void **)(v14 + 48);
      unsigned int v24 = *(void **)(v14 + 56);
      while (v23 != v24)
        objc_msgSend(v5, "appendFormat:", @"  N%ld%p -> N%ld%p;\n", a3, v14, a3, *v23++);
      if (++v13 == v34) {
        goto LABEL_30;
      }
    }
    char v17 = (__CFString *)*(id *)v14;
    int v18 = *(_DWORD *)(v14 + 8);
    int v19 = *(_DWORD *)(v14 + 16);
    id v20 = [(__CFString *)v17 TTShortDescription];
    objc_msgSend(v5, "appendFormat:", @"  N%ld%p [label=\"Start\\n%@,%d\"];\n",
      a3,
      v14,
      v20,
      (v18 + v19 - 1));
LABEL_12:
    self = v33;

    goto LABEL_19;
  }
LABEL_30:
  [v5 appendString:@"}\n"];

  return v5;
}

- (NSUUID)replicaUUID
{
  return self->_replicaUUID;
}

- (void)setHasLocalChanges:(BOOL)a3
{
  self->_hasLocalChanges = a3;
}

- (unint64_t)replicaTextClock
{
  return self->_replicaTextClock;
}

- (unint64_t)replicaStyleClock
{
  return self->_replicaStyleClock;
}

- (void)beginAddAttributesForUniqueParagraphUUIDs
{
}

- (void)endAddAttributesForUniqueParagraphUUIDs
{
}

- (void)deleteSubstrings:(uint64_t)a3 withCharacterRanges:(char)a4
{
  while (2)
  {
    unint64_t v10 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v10;
          uint64_t v11 = (uint64_t)a2 - v10;
          unint64_t v12 = (uint64_t)((uint64_t)a2 - v10) >> 4;
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                unint64_t v34 = *((void *)a2 - 2);
                int v33 = a2 - 1;
                if (*(void *)v10 < v34)
                {
                  long long v87 = *(_OWORD *)v10;
                  *(_OWORD *)unint64_t v10 = *v33;
                  *int v33 = v87;
                }
                break;
              case 3uLL:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ICTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)v10, (unint64_t *)(v10 + 16), (unint64_t *)a2 - 2);
                break;
              case 4uLL:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(ICTTMergeableString *)(long long *)v10 deleteSubstrings:(unint64_t *)(v10 + 32) withCharacterRanges:a2 - 1];
                break;
              case 5uLL:
                uint64_t v35 = (long long *)(v10 + 16);
                uint64_t v36 = (long long *)(v10 + 32);
                id v37 = (long long *)(v10 + 48);
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(ICTTMergeableString *)(long long *)v10 deleteSubstrings:(unint64_t *)(v10 + 32) withCharacterRanges:(_OWORD *)(v10 + 48)];
                unint64_t v39 = *((void *)a2 - 2);
                int v38 = a2 - 1;
                if (*(void *)(v10 + 48) < v39)
                {
                  long long v40 = *v37;
                  *id v37 = *v38;
                  *int v38 = v40;
                  if (*(void *)v36 < *(void *)v37)
                  {
                    long long v41 = *v36;
                    long long *v36 = *v37;
                    *id v37 = v41;
                    if (*(void *)v35 < *(void *)v36)
                    {
                      long long v42 = *v35;
                      *uint64_t v35 = *v36;
                      long long *v36 = v42;
                      if (*(void *)v10 < *(void *)(v10 + 16))
                      {
                        long long v88 = *(_OWORD *)v10;
                        *(_OWORD *)unint64_t v10 = *v35;
                        *uint64_t v35 = v88;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v11 <= 383)
          {
            __int16 v43 = (long long *)(v10 + 16);
            BOOL v45 = (long long *)v10 == a2 || v43 == a2;
            if (a4)
            {
              if (!v45)
              {
                uint64_t v46 = 0;
                uint64_t v47 = (unint64_t *)v10;
                do
                {
                  uint64_t v48 = v43;
                  unint64_t v49 = v47[2];
                  if (*v47 < v49)
                  {
                    unint64_t v50 = v47[3];
                    uint64_t v51 = v46;
                    while (1)
                    {
                      *(_OWORD *)(v10 + v51 + 16) = *(_OWORD *)(v10 + v51);
                      if (!v51) {
                        break;
                      }
                      unint64_t v52 = *(void *)(v10 + v51 - 16);
                      v51 -= 16;
                      if (v52 >= v49)
                      {
                        v53 = (void *)(v10 + v51 + 16);
                        goto LABEL_81;
                      }
                    }
                    v53 = (void *)v10;
LABEL_81:
                    void *v53 = v49;
                    v53[1] = v50;
                  }
                  __int16 v43 = v48 + 1;
                  v46 += 16;
                  uint64_t v47 = (unint64_t *)v48;
                }
                while (v48 + 1 != a2);
              }
            }
            else if (!v45)
            {
              do
              {
                unint64_t v79 = (unint64_t)v43;
                unint64_t v80 = *(void *)(a1 + 16);
                if (*(void *)a1 < v80)
                {
                  uint64_t v81 = *(void *)(a1 + 24);
                  unint64_t v82 = v79;
                  do
                  {
                    *(_OWORD *)unint64_t v82 = *(_OWORD *)(v82 - 16);
                    unint64_t v83 = *(void *)(v82 - 32);
                    v82 -= 16;
                  }
                  while (v83 < v80);
                  *(void *)unint64_t v82 = v80;
                  *(void *)(v82 + 8) = v81;
                }
                __int16 v43 = (long long *)(v79 + 16);
                a1 = v79;
              }
              while ((long long *)(v79 + 16) != a2);
            }
            return;
          }
          if (!a3)
          {
            if ((long long *)v10 != a2)
            {
              int64_t v54 = (v12 - 2) >> 1;
              int64_t v55 = v54;
              do
              {
                int64_t v56 = v55;
                if (v54 >= v55)
                {
                  uint64_t v57 = (2 * v55) | 1;
                  uint64_t v58 = (unint64_t *)(v10 + 16 * v57);
                  unint64_t v59 = *v58;
                  if (2 * v56 + 2 < (uint64_t)v12 && v58[2] < v59)
                  {
                    unint64_t v59 = v58[2];
                    v58 += 2;
                    uint64_t v57 = 2 * v56 + 2;
                  }
                  uint64_t v60 = (long long *)(v10 + 16 * v56);
                  long long v61 = *v60;
                  unint64_t v62 = *(void *)v60;
                  if (*(void *)v60 >= v59)
                  {
                    do
                    {
                      char v63 = (long long *)v58;
                      long long *v60 = *(_OWORD *)v58;
                      if (v54 < v57) {
                        break;
                      }
                      uint64_t v64 = (2 * v57) | 1;
                      uint64_t v58 = (unint64_t *)(v10 + 16 * v64);
                      uint64_t v57 = 2 * v57 + 2;
                      unint64_t v65 = *v58;
                      if (v57 < (uint64_t)v12)
                      {
                        if (v58[2] >= v65)
                        {
                          uint64_t v57 = v64;
                        }
                        else
                        {
                          unint64_t v65 = v58[2];
                          v58 += 2;
                        }
                      }
                      else
                      {
                        uint64_t v57 = v64;
                      }
                      uint64_t v60 = v63;
                    }
                    while (v62 >= v65);
                    *char v63 = v61;
                  }
                }
                int64_t v55 = v56 - 1;
              }
              while (v56);
              uint64_t v66 = (unint64_t)v11 >> 4;
              do
              {
                uint64_t v67 = 0;
                long long v89 = *(_OWORD *)v10;
                uint64_t v68 = (_OWORD *)v10;
                do
                {
                  v69 = &v68[v67 + 1];
                  uint64_t v70 = (2 * v67) | 1;
                  uint64_t v71 = 2 * v67 + 2;
                  if (v71 < v66 && *((void *)v69 + 2) < *(void *)v69)
                  {
                    ++v69;
                    uint64_t v70 = v71;
                  }
                  *uint64_t v68 = *v69;
                  uint64_t v68 = v69;
                  uint64_t v67 = v70;
                }
                while (v70 <= (uint64_t)((unint64_t)(v66 - 2) >> 1));
                if (v69 == --a2)
                {
                  long long *v69 = v89;
                }
                else
                {
                  long long *v69 = *a2;
                  *a2 = v89;
                  uint64_t v72 = (uint64_t)v69 - v10 + 16;
                  if (v72 >= 17)
                  {
                    unint64_t v73 = (((unint64_t)v72 >> 4) - 2) >> 1;
                    uint64_t v74 = (long long *)(v10 + 16 * v73);
                    unint64_t v75 = *(void *)v69;
                    if (*(void *)v69 < *(void *)v74)
                    {
                      uint64_t v76 = *((void *)v69 + 1);
                      do
                      {
                        BOOL v77 = v74;
                        long long *v69 = *v74;
                        if (!v73) {
                          break;
                        }
                        unint64_t v73 = (v73 - 1) >> 1;
                        uint64_t v74 = (long long *)(v10 + 16 * v73);
                        v69 = v77;
                      }
                      while (v75 < *(void *)v74);
                      *(void *)BOOL v77 = v75;
                      *((void *)v77 + 1) = v76;
                    }
                  }
                }
              }
              while (v66-- > 2);
            }
            return;
          }
          unint64_t v13 = v12 >> 1;
          uint64_t v14 = (unint64_t *)(v10 + 16 * (v12 >> 1));
          if ((unint64_t)v11 >= 0x801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ICTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)a1, (unint64_t *)(a1 + 16 * (v12 >> 1)), (unint64_t *)a2 - 2);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ICTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)(a1 + 16), v14 - 2, (unint64_t *)a2 - 4);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ICTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)(a1 + 32), (unint64_t *)(a1 + 16 + 16 * v13), (unint64_t *)a2 - 6);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ICTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)v14 - 1, v14, (unint64_t *)(a1 + 16 + 16 * v13));
            long long v84 = *(_OWORD *)a1;
            *(_OWORD *)a1 = *(_OWORD *)v14;
            *(_OWORD *)uint64_t v14 = v84;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[ICTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>((long long *)(a1 + 16 * (v12 >> 1)), (unint64_t *)a1, (unint64_t *)a2 - 2);
          }
          --a3;
          unint64_t v15 = *(void *)a1;
          if (a4) {
            break;
          }
          uint64_t v16 = *(void *)(a1 + 8);
          if (v15 < *(void *)(a1 - 16)) {
            goto LABEL_12;
          }
          if (*((void *)a2 - 2) >= v15)
          {
            unint64_t v28 = a1 + 16;
            do
            {
              unint64_t v10 = v28;
              if (v28 >= (unint64_t)a2) {
                break;
              }
              v28 += 16;
            }
            while (*(void *)v10 >= v15);
          }
          else
          {
            unint64_t v10 = a1;
            do
            {
              unint64_t v27 = *(void *)(v10 + 16);
              v10 += 16;
            }
            while (v27 >= v15);
          }
          int v29 = a2;
          if (v10 < (unint64_t)a2)
          {
            int v29 = a2;
            do
              unint64_t v30 = *((void *)v29-- - 2);
            while (v30 < v15);
          }
          while (v10 < (unint64_t)v29)
          {
            long long v86 = *(_OWORD *)v10;
            *(_OWORD *)unint64_t v10 = *v29;
            long long *v29 = v86;
            do
            {
              unint64_t v31 = *(void *)(v10 + 16);
              v10 += 16;
            }
            while (v31 >= v15);
            do
              unint64_t v32 = *((void *)v29-- - 2);
            while (v32 < v15);
          }
          BOOL v4 = v10 - 16 >= a1;
          BOOL v5 = v10 - 16 == a1;
          if (v10 - 16 != a1) {
            *(_OWORD *)a1 = *(_OWORD *)(v10 - 16);
          }
          a4 = 0;
          *(void *)(v10 - 16) = v15;
          *(void *)(v10 - 8) = v16;
        }
        uint64_t v16 = *(void *)(a1 + 8);
LABEL_12:
        uint64_t v17 = 0;
        do
        {
          unint64_t v18 = *(void *)(a1 + v17 + 16);
          v17 += 16;
        }
        while (v15 < v18);
        unint64_t v19 = a1 + v17;
        id v20 = a2;
        if (v17 == 16)
        {
          id v20 = a2;
          do
          {
            if (v19 >= (unint64_t)v20) {
              break;
            }
            unint64_t v22 = *((void *)v20-- - 2);
          }
          while (v15 >= v22);
        }
        else
        {
          do
            unint64_t v21 = *((void *)v20-- - 2);
          while (v15 >= v21);
        }
        unint64_t v10 = a1 + v17;
        if (v19 < (unint64_t)v20)
        {
          uint64_t v23 = v20;
          do
          {
            long long v85 = *(_OWORD *)v10;
            *(_OWORD *)unint64_t v10 = *v23;
            long long *v23 = v85;
            do
            {
              unint64_t v24 = *(void *)(v10 + 16);
              v10 += 16;
            }
            while (v15 < v24);
            do
              unint64_t v25 = *((void *)v23-- - 2);
            while (v15 >= v25);
          }
          while (v10 < (unint64_t)v23);
        }
        if (v10 - 16 != a1) {
          *(_OWORD *)a1 = *(_OWORD *)(v10 - 16);
        }
        *(void *)(v10 - 16) = v15;
        *(void *)(v10 - 8) = v16;
        if (v19 >= (unint64_t)v20) {
          break;
        }
LABEL_31:
        std::__introsort<std::_ClassicAlgPolicy,[(ICTTMergeableString *)a1 deleteSubstrings:a3 withCharacterRanges:a4 & 1];
        a4 = 0;
      }
      BOOL v26 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ICTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>(a1, (_OWORD *)(v10 - 16));
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[ICTTMergeableString deleteSubstrings:withCharacterRanges:]::$_1 &,_NSRange *>(v10, a2))
      {
        break;
      }
      if (!v26) {
        goto LABEL_31;
      }
    }
    a2 = (long long *)(v10 - 16);
    if (!v26) {
      continue;
    }
    break;
  }
}

- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4
{
  return [(ICTTMergeableString *)self initWithArchive:a3 replicaID:a4 orderedSubstrings:0];
}

- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4 timestamp:(id)a5
{
  return [(ICTTMergeableString *)self initWithArchive:a3 replicaID:a4 orderedSubstrings:0 timestamp:a5 fragment:0];
}

- (ICTTMergeableString)initWithArchive:(const void *)a3 replicaID:(id)a4 orderedSubstrings:(void *)a5
{
  return [(ICTTMergeableString *)self initWithArchive:a3 replicaID:a4 orderedSubstrings:a5 timestamp:0 fragment:0];
}

- (void)saveToArchive:(void *)a3
{
  [(ICTTMergeableString *)self generateIdsForLocalChanges];
  [(ICTTMergeableString *)self coalesce];
  [(ICTTMergeableString *)self checkTimestampLogStyleErrors:1];
  BOOL v5 = [(ICTTMergeableString *)self orderedSubstrings];
  [(ICTTMergeableString *)self saveSubstrings:v5 archiveSet:0 linkSet:0 archivedString:0 toArchive:a3];
}

- (void)saveSubstrings:(void *)a3 archiveSet:(void *)a4 linkSet:(void *)a5 archivedString:(id *)a6 toArchive:(void *)a7
{
  unint64_t v59 = a6;
  memset(v70, 0, sizeof(v70));
  int v71 = 1065353216;
  uint64_t v11 = *(uint64_t **)a3;
  unint64_t v12 = (uint64_t *)*((void *)a3 + 1);
  if (*(uint64_t **)a3 != v12)
  {
    int v13 = 0;
    do
    {
      uint64_t v69 = *v11;
      v72[0] = &v69;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned int>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned int>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)v70, &v69, (uint64_t)&std::piecewise_construct, v72)+ 6) = v13++;
      ++v11;
    }
    while (v11 != v12);
  }
  id v62 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v14 = [(ICTTMergeableString *)self timestamp];
  uint64_t v66 = [v14 sortedUUIDs];

  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v15 = [MEMORY[0x1E4F29128] TTZero];
  [v67 setObject:&unk_1F1F62838 forKeyedSubscript:v15];
  unint64_t v65 = a4;

  uint64_t v16 = [v66 count];
  if (v16)
  {
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = v17 + 1;
      unint64_t v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", v17 + 1, v59);
      id v20 = [v66 objectAtIndexedSubscript:v17];
      [v67 setObject:v19 forKeyedSubscript:v20];

      uint64_t v17 = v18;
    }
    while (v16 != v18);
  }
  unint64_t v21 = *(uint64_t **)a3;
  uint64_t v64 = (uint64_t *)*((void *)a3 + 1);
  if (*(uint64_t **)a3 != v64)
  {
    long long v61 = (google::protobuf::internal::RepeatedPtrFieldBase *)((char *)a7 + 48);
    do
    {
      uint64_t v69 = 0;
      uint64_t v69 = *v21;
      int v22 = *((_DWORD *)a7 + 15);
      uint64_t v23 = *((int *)a7 + 14);
      if ((int)v23 >= v22)
      {
        if (v22 == *((_DWORD *)a7 + 16)) {
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)v61, v22 + 1);
        }
        google::protobuf::internal::GenericTypeHandler<topotext::Substring>::New();
      }
      uint64_t v24 = *((void *)a7 + 6);
      *((_DWORD *)a7 + 14) = v23 + 1;
      uint64_t v25 = *(void *)(v24 + 8 * v23);
      *(_DWORD *)(v25 + 32) |= 1u;
      uint64_t v26 = *(void *)(v25 + 40);
      if (!v26) {
        operator new();
      }
      unint64_t v27 = objc_msgSend(v67, "objectForKeyedSubscript:", *(void *)v69, v59, v61);
      int v28 = [v27 integerValue];
      *(_DWORD *)(v26 + 32) |= 1u;
      *(_DWORD *)(v26 + 40) = v28;

      *(_DWORD *)(v25 + 32) |= 1u;
      uint64_t v29 = *(void *)(v25 + 40);
      if (!v29) {
        operator new();
      }
      int v30 = *(_DWORD *)(v69 + 8);
      *(_DWORD *)(v29 + 32) |= 2u;
      *(_DWORD *)(v29 + 44) = v30;
      if (v65
        && !std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v65, &v69))
      {
        *(_DWORD *)(v25 + 32) |= 4u;
        int v44 = *(_DWORD **)(v25 + 48);
        if (!v44) {
          operator new();
        }
        v44[8] |= 1u;
        v44[10] = 0;
        *(_DWORD *)(v25 + 32) |= 4u;
        v44[8] |= 2u;
        v44[11] = 0;
      }
      else
      {
        *(_DWORD *)(v25 + 32) |= 4u;
        uint64_t v31 = *(void *)(v25 + 48);
        if (!v31) {
          operator new();
        }
        unint64_t v32 = [v67 objectForKeyedSubscript:*(void *)(v69 + 24)];
        int v33 = [v32 integerValue];
        *(_DWORD *)(v31 + 32) |= 1u;
        *(_DWORD *)(v31 + 40) = v33;

        *(_DWORD *)(v25 + 32) |= 4u;
        uint64_t v34 = *(void *)(v25 + 48);
        if (!v34) {
          operator new();
        }
        uint64_t v35 = v69;
        int v36 = *(_DWORD *)(v69 + 32);
        *(_DWORD *)(v34 + 32) |= 2u;
        *(_DWORD *)(v34 + 44) = v36;
        if (!*(unsigned char *)(v35 + 44))
        {
          uint64_t v37 = *(unsigned int *)(v35 + 40);
          uint64_t v38 = *(unsigned int *)(v35 + 16);
          unint64_t v39 = [(ICTTMergeableString *)self attributedString];
          unint64_t v40 = [v39 length];

          if (v38 + v37 <= v40)
          {
            long long v41 = [(ICTTMergeableString *)self attributedString];
            long long v42 = v41;
            if (*(unsigned char *)(v69 + 44)) {
              uint64_t v43 = 0;
            }
            else {
              uint64_t v43 = *(unsigned int *)(v69 + 16);
            }
            unint64_t v52 = objc_msgSend(v41, "attributedSubstringFromRange:", *(unsigned int *)(v69 + 40), v43);
            [v62 appendAttributedString:v52];
          }
          goto LABEL_32;
        }
      }
      *(_DWORD *)(v25 + 32) |= 8u;
      *(unsigned char *)(v25 + 60) = 1;
LABEL_32:
      uint64_t v45 = v69;
      int v46 = *(_DWORD *)(v69 + 16);
      *(_DWORD *)(v25 + 32) |= 2u;
      *(_DWORD *)(v25 + 56) = v46;
      uint64_t v47 = *(uint64_t **)(v45 + 48);
      for (uint64_t i = *(uint64_t **)(v45 + 56); v47 != i; ++v47)
      {
        uint64_t v68 = 0;
        uint64_t v68 = *v47;
        if (!a5
          || std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(a5, &v68))
        {
          v72[0] = &v68;
          int v49 = *((_DWORD *)std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned int>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned int>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned int>>>::__emplace_unique_key_args<TopoSubstring *,std::piecewise_construct_t const&,std::tuple<TopoSubstring * const&>,std::tuple<>>((uint64_t)v70, &v68, (uint64_t)&std::piecewise_construct, v72)+ 6);
          int v50 = *(_DWORD *)(v25 + 72);
          if (v50 == *(_DWORD *)(v25 + 76))
          {
            google::protobuf::RepeatedField<unsigned int>::Reserve(v25 + 64, v50 + 1);
            int v50 = *(_DWORD *)(v25 + 72);
          }
          uint64_t v51 = *(void *)(v25 + 64);
          *(_DWORD *)(v25 + 72) = v50 + 1;
          *(_DWORD *)(v51 + 4 * v50) = v49;
        }
      }
      ++v21;
    }
    while (v21 != v64);
  }
  objc_msgSend(v62, "string", v59);
  id v53 = objc_claimAutoreleasedReturnValue();
  [v53 UTF8String];
  int64_t v54 = [v62 string];
  [v54 lengthOfBytesUsingEncoding:4];
  *((_DWORD *)a7 + 8) |= 1u;
  if (!google::protobuf::internal::empty_string_) {
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  }
  if (*((void *)a7 + 5) == google::protobuf::internal::empty_string_) {
    operator new();
  }
  MEMORY[0x1C877D5C0]();

  if (v60) {
    void *v60 = v62;
  }
  int64_t v55 = [(ICTTMergeableString *)self timestamp];
  char v56 = [v55 isDocumentShared];

  if ((v56 & 1) == 0)
  {
    uint64_t v57 = [(ICTTMergeableString *)self timestamp];
    *((_DWORD *)a7 + 8) |= 4u;
    uint64_t v58 = *((void *)a7 + 9);
    if (!v58) {
      operator new();
    }
    [v57 saveToArchive:v58];
  }
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v70);
}

- (id)serialize
{
  topotext::String::String((topotext::String *)v7);
  [(ICTTMergeableString *)self saveToArchive:v7];
  id v3 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::String::ByteSize((topotext::String *)v7)];
  BOOL v4 = (void *)[v3 mutableBytes];
  int v5 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v3 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::String::~String((topotext::String *)v7);
  return v3;
}

- (id)i_saveDeltasSinceTimestamp:(id)a3 toArchive:(void *)a4
{
  id v6 = a3;
  [(ICTTMergeableString *)self generateIdsForLocalChanges];
  [(ICTTMergeableString *)self coalesce];
  char v56 = self;
  uint64_t v57 = a4;
  uint64_t v66 = 0;
  id v67 = 0;
  v68[0] = 0;
  memset(v64, 0, sizeof(v64));
  int v65 = 1065353216;
  memset(v62, 0, sizeof(v62));
  int v63 = 1065353216;
  BOOL v7 = [(ICTTMergeableString *)self orderedSubstrings];
  uint64_t v8 = *v7;
  uint64_t v58 = v7[1];
  if (*v7 != v58)
  {
    do
    {
      uint64_t v9 = *v8;
      uint64_t v61 = v9;
      id v10 = *(id *)v9;
      int v11 = *(_DWORD *)(v9 + 8);
      LODWORD(v9) = *(_DWORD *)(v9 + 16);
      unsigned int v12 = [v6 clockForUUID:v10 atIndex:0];
      unsigned int v13 = [v6 clockForUUID:v10 atIndex:1];
      if ((int)v9 + v11 >= v12 || *(_DWORD *)(v61 + 32) >= v13)
      {
        std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v62, &v61, &v61);
        if (!std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v64, &v61))
        {
          unint64_t v32 = v67;
          if ((unint64_t)v67 >= v68[0])
          {
            uint64_t v34 = (v67 - v66) >> 3;
            if ((unint64_t)(v34 + 1) >> 61) {
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v35 = (uint64_t)(v68[0] - (void)v66) >> 2;
            if (v35 <= v34 + 1) {
              unint64_t v35 = v34 + 1;
            }
            if (v68[0] - (void)v66 >= 0x7FFFFFFFFFFFFFF8uLL) {
              unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v36 = v35;
            }
            if (v36) {
              uint64_t v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v68, v36);
            }
            else {
              uint64_t v37 = 0;
            }
            uint64_t v38 = &v37[8 * v34];
            *(void *)uint64_t v38 = v61;
            int v33 = v38 + 8;
            unint64_t v40 = v66;
            unint64_t v39 = v67;
            if (v67 != v66)
            {
              do
              {
                uint64_t v41 = *((void *)v39 - 1);
                v39 -= 8;
                *((void *)v38 - 1) = v41;
                v38 -= 8;
              }
              while (v39 != v40);
              unint64_t v39 = v66;
            }
            uint64_t v66 = v38;
            id v67 = v33;
            v68[0] = &v37[8 * v36];
            if (v39) {
              operator delete(v39);
            }
          }
          else
          {
            *(void *)id v67 = v61;
            int v33 = v32 + 8;
          }
          id v67 = v33;
          std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v64, &v61, &v61);
        }
        long long v42 = *(uint64_t **)(v61 + 48);
        uint64_t v43 = *(uint64_t **)(v61 + 56);
        while (v42 != v43)
        {
          uint64_t v60 = 0;
          uint64_t v60 = *v42;
          if (!std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v64, &v60))
          {
            int v44 = v67;
            if ((unint64_t)v67 >= v68[0])
            {
              uint64_t v46 = (v67 - v66) >> 3;
              if ((unint64_t)(v46 + 1) >> 61) {
                std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v47 = (uint64_t)(v68[0] - (void)v66) >> 2;
              if (v47 <= v46 + 1) {
                unint64_t v47 = v46 + 1;
              }
              if (v68[0] - (void)v66 >= 0x7FFFFFFFFFFFFFF8uLL) {
                unint64_t v48 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v48 = v47;
              }
              if (v48) {
                int v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v68, v48);
              }
              else {
                int v49 = 0;
              }
              int v50 = &v49[8 * v46];
              *(void *)int v50 = v60;
              uint64_t v45 = v50 + 8;
              unint64_t v52 = v66;
              uint64_t v51 = v67;
              if (v67 != v66)
              {
                do
                {
                  uint64_t v53 = *((void *)v51 - 1);
                  v51 -= 8;
                  *((void *)v50 - 1) = v53;
                  v50 -= 8;
                }
                while (v51 != v52);
                uint64_t v51 = v66;
              }
              uint64_t v66 = v50;
              id v67 = v45;
              v68[0] = &v49[8 * v48];
              if (v51) {
                operator delete(v51);
              }
            }
            else
            {
              *(void *)id v67 = v60;
              uint64_t v45 = v44 + 8;
            }
            id v67 = v45;
            std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v64, &v60, &v60);
          }
          ++v42;
        }
      }
      else
      {
        uint64_t v14 = *(id ***)(v61 + 48);
        unint64_t v15 = *(id ***)(v61 + 56);
        while (v14 != v15)
        {
          uint64_t v16 = *v14;
          id v17 = **v14;
          int v18 = *((_DWORD *)v16 + 2);
          int v19 = *((_DWORD *)v16 + 4);
          unsigned int v20 = [v6 clockForUUID:v17 atIndex:0];
          unsigned int v21 = [v6 clockForUUID:v17 atIndex:1];
          if ((v19 + v18 >= v20 || *((_DWORD *)v16 + 8) >= v21)
            && !std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(v64, &v61))
          {
            int v22 = v67;
            if ((unint64_t)v67 >= v68[0])
            {
              uint64_t v24 = (v67 - v66) >> 3;
              if ((unint64_t)(v24 + 1) >> 61) {
                std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v25 = (uint64_t)(v68[0] - (void)v66) >> 2;
              if (v25 <= v24 + 1) {
                unint64_t v25 = v24 + 1;
              }
              if (v68[0] - (void)v66 >= 0x7FFFFFFFFFFFFFF8uLL) {
                unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v26 = v25;
              }
              if (v26) {
                unint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoSubstring *>>((uint64_t)v68, v26);
              }
              else {
                unint64_t v27 = 0;
              }
              int v28 = &v27[8 * v24];
              *(void *)int v28 = v61;
              uint64_t v23 = v28 + 8;
              int v30 = v66;
              uint64_t v29 = v67;
              if (v67 != v66)
              {
                do
                {
                  uint64_t v31 = *((void *)v29 - 1);
                  v29 -= 8;
                  *((void *)v28 - 1) = v31;
                  v28 -= 8;
                }
                while (v29 != v30);
                uint64_t v29 = v66;
              }
              uint64_t v66 = v28;
              id v67 = v23;
              v68[0] = &v27[8 * v26];
              if (v29) {
                operator delete(v29);
              }
            }
            else
            {
              *(void *)id v67 = v61;
              uint64_t v23 = v22 + 8;
            }
            id v67 = v23;
            std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)v64, &v61, &v61);
          }

          ++v14;
        }
      }

      ++v8;
    }
    while (v8 != v58);
  }
  id v59 = 0;
  [(ICTTMergeableString *)v56 saveSubstrings:&v66 archiveSet:v62 linkSet:v64 archivedString:&v59 toArchive:v57];
  id v54 = v59;
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v62);
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)v64);
  if (v66)
  {
    id v67 = v66;
    operator delete(v66);
  }

  return v54;
}

- (void)saveDeltaSinceTimestamp:(id)a3 toArchive:(void *)a4
{
  id v4 = [(ICTTMergeableString *)self i_saveDeltasSinceTimestamp:a3 toArchive:a4];
}

- (id)serializeDeltaSinceTimestamp:(id)a3
{
  id v4 = a3;
  if ([(ICTTMergeableString *)self hasLocalChanges]
    || ([(ICTTMergeableString *)self timestamp],
        int v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqual:v4],
        v5,
        (v6 & 1) == 0))
  {
    topotext::String::String((topotext::String *)v12);
    [(ICTTMergeableString *)self saveDeltaSinceTimestamp:v4 toArchive:v12];
    id v7 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::String::ByteSize((topotext::String *)v12)];
    uint64_t v8 = (void *)[v7 mutableBytes];
    int v9 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v7 length]);
    google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v12, v8, v9);
    topotext::String::~String((topotext::String *)v12);
  }
  else
  {
    id v7 = 0;
  }
  id v10 = (void *)[v7 copy];

  return v10;
}

- (ICCRTTCompatibleDocument)document
{
  uint64_t v2 = objc_getAssociatedObject(self, (const void *)ICTTMergeableStringICCRDataTypeICCRDocumentWeakObjectKey);
  id v3 = [v2 object];

  return (ICCRTTCompatibleDocument *)v3;
}

- (void)setDocument:(id)a3
{
  id v9 = a3;
  id v4 = [v9 replica];
  [(ICTTMergeableString *)self setReplicaUUID:v4];

  objc_opt_class();
  int v5 = ICDynamicCast();
  char v6 = v5;
  if (v5)
  {
    id v7 = [v5 sharedTopotextTimestamp];
    [(ICTTMergeableString *)self setTimestamp:v7];

    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F83800]) initWithObject:v6];
    objc_setAssociatedObject(self, (const void *)ICTTMergeableStringICCRDataTypeICCRDocumentWeakObjectKey, v8, (void *)0x301);
  }
  else if (v9)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICTTMergeableString(ICCRDataType) setDocument:]" simulateCrash:1 showAlert:0 format:@"ICTTMergeableString document set to non-TT-compatible document."];
  }
}

- (void)mergeWith:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Invalid merge, classes must be equal for merge.", 0 reason userInfo];
      objc_exception_throw(v7);
    }
    [(ICTTMergeableString *)self mergeWithString:v8 mergeTimestamps:0];
    id v4 = [(ICTTMergeableString *)self document];

    if (v4)
    {
      int v5 = [(ICTTMergeableString *)self document];
      char v6 = [v5 stringsWithClocksNeedingUpdating];
      [v6 addObject:self];
    }
  }
}

- (void)realizeLocalChangesIn:(id)a3
{
  [(ICTTMergeableString *)self generateIdsForLocalChanges];
  id v4 = [(ICTTMergeableString *)self document];

  if (v4)
  {
    id v6 = [(ICTTMergeableString *)self document];
    int v5 = [v6 stringsWithClocksToResetAfterRealizingLocalChanges];
    [v5 addObject:self];
  }
}

- (void)check:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Corrupt mergeable string, length of substrings != attributedString length.", v2, v3, v4, v5, v6);
}

- (void)check:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Corrupt mergeable string, substring max > string max.", buf, 2u);
}

void __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Style clock is too low.", v2, v3, v4, v5, v6);
}

void __52__ICTTMergeableString_checkTimestampLogStyleErrors___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Text clock is too low.", v2, v3, v4, v5, v6);
}

- (void)mergeWithString:mergeTimestamps:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Failed to merge strings.", v2, v3, v4, v5, v6);
}

- (void)mergeWithString:(uint64_t)a1 mergeTimestamps:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Failed to merge strings: %@", (uint8_t *)&v2, 0xCu);
}

@end