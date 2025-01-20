@interface TTSSpeechString
- (BOOL)_rangeIsValid:(_NSRange)a3;
- (BOOL)encapsulateSubstringAtRange:(_NSRange)a3 withPrefix:(id)a4 andSuffix:(id)a5;
- (BOOL)finalized;
- (BOOL)insertAtLocation:(unint64_t)a3 string:(id)a4;
- (BOOL)transformRange:(_NSRange)a3 to:(id)a4;
- (NSMutableArray)transformations;
- (NSString)defrostedTransformedString;
- (NSString)originalString;
- (NSString)transformedString;
- (TTSSpeechString)initWithOriginalString:(id)a3;
- (TTSSpeechString)initWithParentSpeechString:(id)a3;
- (TTSSpeechString)initWithSSMLString:(id)a3;
- (TTSSpeechString)parentString;
- (_NSRange)_translateRangeInTransformedString:(_NSRange)a3 withParent:(id)a4;
- (_NSRange)translateRangeInTransformedString:(_NSRange)a3;
- (id)_transformedStringNonMutating;
- (id)xmlEscaped;
- (id)xmlUnescaped;
- (unint64_t)type;
- (void)_insertTransformation:(id)a3 forEncapsulatedTerminator:(BOOL)a4;
- (void)replaceOccurencesOfString:(id)a3 withString:(id)a4;
- (void)setOriginalString:(id)a3;
- (void)setParentString:(id)a3;
- (void)setTransformations:(id)a3;
- (void)setTransformedString:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TTSSpeechString

- (TTSSpeechString)initWithParentSpeechString:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TTSSpeechString;
  v10 = [(TTSSpeechString *)&v29 init];
  if (v10)
  {
    v11 = objc_msgSend_transformedString(v5, v6, v7, v8, v9);
    uint64_t v16 = objc_msgSend_copy(v11, v12, v13, v14, v15);
    originalString = v10->_originalString;
    v10->_originalString = (NSString *)v16;

    objc_storeStrong((id *)&v10->_parentString, a3);
    uint64_t v22 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20, v21);
    transformations = v10->_transformations;
    v10->_transformations = (NSMutableArray *)v22;

    v10->_type = objc_msgSend_type(v5, v24, v25, v26, v27);
  }

  return v10;
}

- (TTSSpeechString)initWithOriginalString:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TTSSpeechString;
  uint64_t v9 = [(TTSSpeechString *)&v19 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    originalString = v9->_originalString;
    v9->_originalString = (NSString *)v10;

    uint64_t v16 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14, v15);
    transformations = v9->_transformations;
    v9->_transformations = (NSMutableArray *)v16;

    v9->_type = 0;
  }

  return v9;
}

- (TTSSpeechString)initWithSSMLString:(id)a3
{
  result = (TTSSpeechString *)objc_msgSend_initWithOriginalString_(self, a2, (uint64_t)a3, v3, v4);
  result->_type = 1;
  return result;
}

- (BOOL)finalized
{
  return self->_transformedString != 0;
}

- (void)replaceOccurencesOfString:(id)a3 withString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v12 = objc_msgSend_sharedInstance(TTSRegexCache, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_regexForString_(v12, v13, (uint64_t)v7, v14, v15);

  uint64_t v21 = objc_msgSend_originalString(self, v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_originalString(self, v22, v23, v24, v25);
  uint64_t v31 = objc_msgSend_length(v26, v27, v28, v29, v30);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1A672E9C8;
  v34[3] = &unk_1E5C69D48;
  v34[4] = self;
  id v35 = v6;
  id v32 = v6;
  objc_msgSend_enumerateMatchesInString_options_range_usingBlock_(v16, v33, (uint64_t)v21, 2, 0, v31, v34);
}

- (BOOL)transformRange:(_NSRange)a3 to:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (objc_msgSend__rangeIsValid_(self, v8, location, length, v9))
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = objc_msgSend_transformations(self, v10, v11, v12, v13, 0);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v16)
    {
      uint64_t v21 = v16;
      uint64_t v22 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v14);
          }
          v38.NSUInteger location = objc_msgSend_range(*(void **)(*((void *)&v31 + 1) + 8 * i), v17, v18, v19, v20);
          v38.NSUInteger length = v24;
          v37.NSUInteger location = location;
          v37.NSUInteger length = length;
          v17 = (const char *)NSIntersectionRange(v37, v38).length;
          if (v17)
          {
            BOOL v29 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, 0, (uint64_t)&v31, (uint64_t)v35, 16);
        if (v21) {
          continue;
        }
        break;
      }
    }

    uint64_t v25 = [TTSStringTransformation alloc];
    uint64_t v14 = objc_msgSend_initWithRange_andReplacement_(v25, v26, location, length, (uint64_t)v7);
    objc_msgSend__insertTransformation_forEncapsulatedTerminator_(self, v27, (uint64_t)v14, 0, v28);
    BOOL v29 = 1;
LABEL_13:
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (BOOL)insertAtLocation:(unint64_t)a3 string:(id)a4
{
  id v6 = a4;
  uint64_t v11 = objc_msgSend_originalString(self, v7, v8, v9, v10);
  unint64_t v16 = objc_msgSend_length(v11, v12, v13, v14, v15);

  if (v16 >= a3)
  {
    v17 = [TTSStringTransformation alloc];
    uint64_t v19 = objc_msgSend_initWithRange_andReplacement_(v17, v18, a3, 0, (uint64_t)v6);
    objc_msgSend__insertTransformation_forEncapsulatedTerminator_(self, v20, (uint64_t)v19, 0, v21);
  }
  return v16 >= a3;
}

- (BOOL)encapsulateSubstringAtRange:(_NSRange)a3 withPrefix:(id)a4 andSuffix:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = a5;
  int IsValid = objc_msgSend__rangeIsValid_(self, v11, location, length, v12);
  if (IsValid)
  {
    if (objc_msgSend_length(v9, v13, v14, v15, v16)) {
      objc_msgSend_insertAtLocation_string_(self, v18, location, (uint64_t)v9, v21);
    }
    if (objc_msgSend_length(v10, v18, v19, v20, v21))
    {
      uint64_t v22 = [TTSStringTransformation alloc];
      NSUInteger v24 = objc_msgSend_initWithRange_andReplacement_(v22, v23, location + length, 0, (uint64_t)v10);
      objc_msgSend__insertTransformation_forEncapsulatedTerminator_(self, v25, (uint64_t)v24, 1, v26);
    }
  }

  return IsValid;
}

- (_NSRange)translateRangeInTransformedString:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = objc_msgSend_parentString(self, a2, a3.location, a3.length, v3);
  uint64_t v9 = objc_msgSend__translateRangeInTransformedString_withParent_(self, v8, location, length, (uint64_t)v7);
  NSUInteger v11 = v10;

  NSUInteger v12 = v9;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (_NSRange)_translateRangeInTransformedString:(_NSRange)a3 withParent:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  NSUInteger v12 = objc_msgSend_transformations(self, v8, v9, v10, v11);
  v17 = objc_msgSend_reverseObjectEnumerator(v12, v13, v14, v15, v16);

  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v104, (uint64_t)v108, 16);
  if (v19)
  {
    uint64_t v24 = v19;
    uint64_t v25 = 0;
    uint64_t v26 = *(void *)v105;
    v103 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v105 != v26) {
          objc_enumerationMutation(v17);
        }
        uint64_t v28 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        v114.NSUInteger location = objc_msgSend_finalRange(v28, v20, v21, v22, v23);
        v114.NSUInteger length = v29;
        v110.NSUInteger location = location;
        v110.NSUInteger length = length;
        NSRange v33 = NSIntersectionRange(v110, v114);
        if (v33.length == length)
        {
          uint64_t v42 = objc_msgSend_range(v28, (const char *)v33.length, v30, v31, v32);
          NSUInteger length = (NSUInteger)v40;
          id v7 = v103;
          if (v103)
          {
            NSUInteger v43 = objc_msgSend_translateRangeInTransformedString_(v103, v40, v42, (uint64_t)v40, v41);
            goto LABEL_25;
          }
LABEL_26:

          goto LABEL_27;
        }
        unint64_t v34 = objc_msgSend_finalRange(v28, (const char *)v33.length, v30, v31, v32);
        if (v33.length) {
          BOOL v39 = 1;
        }
        else {
          BOOL v39 = location >= v34;
        }
        if (!v39)
        {
          id v7 = v103;
          goto LABEL_19;
        }
        if (v33.length)
        {
          v115.NSUInteger location = objc_msgSend_finalRange(v28, v35, v36, v37, v38);
          v115.NSUInteger length = v48;
          v111.NSUInteger location = location;
          v111.NSUInteger length = length;
          NSRange v49 = NSUnionRange(v111, v115);
          uint64_t v53 = objc_msgSend_finalRange(v28, (const char *)v49.length, v50, v51, v52);
          objc_msgSend_finalRange(v28, v54, v55, v56, v57);
          v59 = v58;
          uint64_t v63 = objc_msgSend_finalRange(v28, v58, v60, v61, v62);
          objc_msgSend_finalRange(v28, v64, v65, v66, v67);
          v69 = v68;
          uint64_t v73 = objc_msgSend_finalRange(v28, v68, v70, v71, v72);
          uint64_t v101 = (uint64_t)v74;
          uint64_t v102 = v73;
          if (v49.location >= objc_msgSend_finalRange(v28, v74, v75, v76, v77))
          {
            NSUInteger v83 = (NSUInteger)&v59[v53];
            uint64_t v82 = v49.location + v49.length - (void)&v69[v63];
          }
          else
          {
            uint64_t v82 = objc_msgSend_finalRange(v28, v78, v79, v80, v81) - v49.location;
            NSUInteger v83 = v49.location;
          }
          id v7 = v103;
          v84 = objc_msgSend_parentString(self, v78, v79, v80, v81);
          NSUInteger v86 = objc_msgSend__translateRangeInTransformedString_withParent_(self, v85, v83, v82, (uint64_t)v84);
          NSUInteger v88 = v87;

          v93 = objc_msgSend_parentString(self, v89, v90, v91, v92);
          NSUInteger v95 = objc_msgSend__translateRangeInTransformedString_withParent_(self, v94, v102, v101, (uint64_t)v93);
          NSUInteger v97 = v96;

          v112.NSUInteger location = v95;
          v112.NSUInteger length = v97;
          v116.NSUInteger location = v86;
          v116.NSUInteger length = v88;
          NSRange v98 = NSUnionRange(v112, v116);
          NSUInteger v44 = v98.length;
          NSUInteger v43 = v98.location;
LABEL_25:
          uint64_t v42 = v43;
          NSUInteger length = v44;
          goto LABEL_26;
        }
        v25 += objc_msgSend_sizeDelta(v28, v35, v36, v37, v38);
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v104, (uint64_t)v108, 16);
      id v7 = v103;
      if (v24) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }
LABEL_19:

  uint64_t v42 = location - v25;
  if (v7)
  {
    uint64_t v42 = objc_msgSend_translateRangeInTransformedString_(v7, v45, location - v25, length, v46);
    NSUInteger length = v47;
  }
LABEL_27:

  NSUInteger v99 = v42;
  NSUInteger v100 = length;
  result.NSUInteger length = v100;
  result.NSUInteger location = v99;
  return result;
}

- (NSString)defrostedTransformedString
{
  transformedString = self->_transformedString;
  if (transformedString)
  {
    id v6 = transformedString;
  }
  else
  {
    objc_msgSend__transformedStringNonMutating(self, a2, v2, v3, v4);
    id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_transformedStringNonMutating
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend_originalString(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v16 = objc_msgSend_transformations(self, v12, v13, v14, v15, 0);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v18)
  {
    uint64_t v23 = v18;
    uint64_t v24 = *(void *)v38;
    do
    {
      uint64_t v25 = 0;
      uint64_t v26 = v11;
      do
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v16);
        }
        uint64_t v27 = *(void **)(*((void *)&v37 + 1) + 8 * v25);
        uint64_t v28 = objc_msgSend_range(v27, v19, v20, v21, v22);
        uint64_t v30 = (uint64_t)v29;
        unint64_t v34 = objc_msgSend_replacement(v27, v29, v31, v32, v33);
        uint64_t v11 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v26, v35, v28, v30, (uint64_t)v34);

        ++v25;
        uint64_t v26 = v11;
      }
      while (v23 != v25);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v23);
  }

  return v11;
}

- (NSString)transformedString
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  transformedString = self->_transformedString;
  if (transformedString)
  {
    id v6 = transformedString;
  }
  else
  {
    uint64_t v8 = objc_msgSend_originalString(self, a2, v2, v3, v4);
    uint64_t v13 = objc_msgSend_copy(v8, v9, v10, v11, v12);

    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    v113 = self;
    objc_msgSend_transformations(self, v14, v15, v16, v17);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v118, (uint64_t)v123, 16);
    if (v19)
    {
      uint64_t v24 = v19;
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v119;
      do
      {
        uint64_t v27 = 0;
        uint64_t v28 = v13;
        do
        {
          if (*(void *)v119 != v26) {
            objc_enumerationMutation(obj);
          }
          NSUInteger v29 = *(void **)(*((void *)&v118 + 1) + 8 * v27);
          uint64_t v30 = objc_msgSend_range(v29, v20, v21, v22, v23);
          uint64_t v32 = (uint64_t)v31;
          uint64_t v36 = objc_msgSend_replacement(v29, v31, v33, v34, v35);
          uint64_t v13 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v28, v37, v30, v32, (uint64_t)v36);

          uint64_t v42 = objc_msgSend_originalString(v113, v38, v39, v40, v41);
          uint64_t v47 = objc_msgSend_length(v42, v43, v44, v45, v46);
          uint64_t v52 = objc_msgSend_range(v29, v48, v49, v50, v51);
          objc_msgSend_range(v29, v53, v54, v55, v56);
          uint64_t v58 = v57;

          objc_msgSend_setOffsetFromEnd_(v29, v59, v47 + v25 - (v52 + v58), v60, v61);
          v25 += objc_msgSend_sizeDelta(v29, v62, v63, v64, v65);
          ++v27;
          uint64_t v28 = v13;
        }
        while (v24 != v27);
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v118, (uint64_t)v123, 16);
      }
      while (v24);
    }

    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    uint64_t v70 = objc_msgSend_transformations(v113, v66, v67, v68, v69);
    uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v114, (uint64_t)v122, 16);
    if (v72)
    {
      uint64_t v77 = v72;
      uint64_t v78 = *(void *)v115;
      do
      {
        for (uint64_t i = 0; i != v77; ++i)
        {
          if (*(void *)v115 != v78) {
            objc_enumerationMutation(v70);
          }
          uint64_t v80 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          uint64_t v81 = objc_msgSend_length(v13, v73, v74, v75, v76);
          uint64_t v86 = objc_msgSend_offsetFromEnd(v80, v82, v83, v84, v85);
          uint64_t v91 = objc_msgSend_replacement(v80, v87, v88, v89, v90);
          uint64_t v96 = v81 - v86 - objc_msgSend_length(v91, v92, v93, v94, v95);
          uint64_t v101 = objc_msgSend_replacement(v80, v97, v98, v99, v100);
          uint64_t v106 = objc_msgSend_length(v101, v102, v103, v104, v105);
          objc_msgSend_setFinalRange_(v80, v107, v96, v106, v108);
        }
        uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v73, (uint64_t)&v114, (uint64_t)v122, 16);
      }
      while (v77);
    }

    uint64_t v109 = v113->_transformedString;
    v113->_transformedString = (NSString *)v13;
    id v110 = v13;

    id v6 = v113->_transformedString;
  }

  return v6;
}

- (BOOL)_rangeIsValid:(_NSRange)a3
{
  if (self->_transformedString) {
    return 0;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = objc_msgSend_originalString(self, a2, a3.location, a3.length, v3);
  v14.NSUInteger length = objc_msgSend_length(v7, v8, v9, v10, v11);
  v13.NSUInteger location = location;
  v13.NSUInteger length = length;
  v14.NSUInteger location = 0;
  BOOL v4 = NSIntersectionRange(v13, v14).length == length;

  return v4;
}

- (void)_insertTransformation:(id)a3 forEncapsulatedTerminator:(BOOL)a4
{
  BOOL v5 = a4;
  id v11 = a3;
  if (!v5) {
    goto LABEL_3;
  }
  uint64_t v12 = objc_msgSend_transformations(self, v7, v8, v9, v10);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = sub_1A672F6FC;
  v41[3] = &unk_1E5C6AA88;
  BOOL v4 = &v42;
  id v13 = v11;
  id v42 = v13;
  uint64_t v17 = objc_msgSend_indexOfObjectPassingTest_(v12, v14, (uint64_t)v41, v15, v16);

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = objc_msgSend_transformations(self, v7, v8, v9, v10);
    objc_msgSend_insertObject_atIndex_(v18, v22, (uint64_t)v13, v17, v23);
  }
  else
  {
LABEL_3:
    uint64_t v18 = objc_msgSend_transformations(self, v7, v8, v9, v10);
    objc_msgSend_addObject_(v18, v19, (uint64_t)v11, v20, v21);
  }

  uint64_t v28 = objc_msgSend_transformations(self, v24, v25, v26, v27);
  uint64_t v32 = objc_msgSend_sortedArrayUsingComparator_(v28, v29, (uint64_t)&unk_1EFB80480, v30, v31);
  long long v37 = objc_msgSend_mutableCopy(v32, v33, v34, v35, v36);
  objc_msgSend_setTransformations_(self, v38, (uint64_t)v37, v39, v40);

  if (v5) {
}
  }

- (id)xmlEscaped
{
  objc_msgSend_replaceOccurencesOfString_withString_(self, a2, @"&", @"&amp;", v2);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v4, @">", @"&gt;", v5);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v6, @"\", @"&quot;"", v7);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v8, @"'", @"&apos;", v9);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v10, @"<", @"&lt;", v11);
  uint64_t v12 = [TTSSpeechString alloc];
  uint64_t v16 = objc_msgSend_initWithParentSpeechString_(v12, v13, (uint64_t)self, v14, v15);

  return v16;
}

- (id)xmlUnescaped
{
  objc_msgSend_replaceOccurencesOfString_withString_(self, a2, @"&lt;", @"<", v2);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v4, @"&gt;", @">", v5);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v6, @"&quot;", @"\"", v7);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v8, @"&apos;", @"'", v9);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v10, @"&amp;", @"&", v11);
  uint64_t v12 = [TTSSpeechString alloc];
  uint64_t v16 = objc_msgSend_initWithParentSpeechString_(v12, v13, (uint64_t)self, v14, v15);

  return v16;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setTransformedString:(id)a3
{
}

- (NSString)originalString
{
  return self->_originalString;
}

- (void)setOriginalString:(id)a3
{
}

- (TTSSpeechString)parentString
{
  return self->_parentString;
}

- (void)setParentString:(id)a3
{
}

- (NSMutableArray)transformations
{
  return self->_transformations;
}

- (void)setTransformations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformations, 0);
  objc_storeStrong((id *)&self->_parentString, 0);
  objc_storeStrong((id *)&self->_originalString, 0);

  objc_storeStrong((id *)&self->_transformedString, 0);
}

@end