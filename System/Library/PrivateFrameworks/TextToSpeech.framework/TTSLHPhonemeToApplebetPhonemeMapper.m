@interface TTSLHPhonemeToApplebetPhonemeMapper
+ (id)_acceptRule;
+ (id)_initializeRules;
+ (id)_leftRaisingContextRule;
+ (id)_phonemeArray:(id)a3;
+ (id)_phonemeRules;
+ (id)_phonoMatch:(id)a3 match:(id)a4 matchpos:(int)a5 count:(int)a6;
+ (id)_phonoTranslation:(id)a3;
+ (id)_retrieveRegularExpression:(id)a3;
+ (id)_rightRaisingContextRule;
+ (id)_uberLeftRaisingContextRule;
+ (id)_uberRightRaisingContextRule;
+ (id)_uberUberRightRaisingContextRule;
+ (id)_uberUberUberRightRaisingContextRule;
+ (id)convertLHToApplebet:(id)a3;
@end

@implementation TTSLHPhonemeToApplebetPhonemeMapper

+ (id)_retrieveRegularExpression:(id)a3
{
  id v3 = a3;
  if (qword_1E96C46D8 != -1) {
    dispatch_once(&qword_1E96C46D8, &unk_1EFB80280);
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1A66DCC3C;
  v21 = sub_1A66DCC4C;
  id v22 = 0;
  v14[1] = (id)MEMORY[0x1E4F143A8];
  v14[2] = (id)3221225472;
  v14[3] = sub_1A66DCC54;
  v14[4] = &unk_1E5C69460;
  v16 = &v17;
  id v4 = v3;
  id v15 = v4;
  AX_PERFORM_WITH_LOCK();
  v6 = (void *)v18[5];
  if (!v6)
  {
    v14[0] = 0;
    uint64_t v7 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E4F28FD8], v5, (uint64_t)v4, 0, (uint64_t)v14);
    id v8 = v14[0];
    v9 = (void *)v18[5];
    v18[5] = v7;

    if (v8)
    {
      v10 = AXTTSLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1A688C1D8((uint64_t)v8, v10);
      }
    }
    else
    {
      v13 = v4;
      AX_PERFORM_WITH_LOCK();
      v10 = v13;
    }

    v6 = (void *)v18[5];
  }
  id v11 = v6;

  _Block_object_dispose(&v17, 8);

  return v11;
}

+ (id)_phonoMatch:(id)a3 match:(id)a4 matchpos:(int)a5 count:(int)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v53 = a4;
  v13 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v53;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v56, (uint64_t)v60, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v57;
    while (2)
    {
      uint64_t v20 = 0;
      uint64_t v21 = a5;
      do
      {
        if (*(void *)v57 != v19) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v56 + 1) + 8 * v20);
        v23 = objc_msgSend_objectAtIndexedSubscript_(v55, v15, v21 + v20, v16, v17);
        v28 = objc_msgSend_phoneme(v23, v24, v25, v26, v27);

        v32 = objc_msgSend_stringWithFormat_(NSString, v29, @"^%@\\d?$", v30, v31, v22);
        v36 = objc_msgSend__retrieveRegularExpression_(a1, v33, (uint64_t)v32, v34, v35);

        uint64_t v41 = objc_msgSend_length(v28, v37, v38, v39, v40);
        v43 = objc_msgSend_firstMatchInString_options_range_(v36, v42, (uint64_t)v28, 0, 0, v41);
        if ((objc_msgSend_isEqualToString_(v22, v44, @"()", v45, v46) & 1) == 0
          && (!v43 || objc_msgSend_range(v43, v47, v48, v49, v50) == 0x7FFFFFFFFFFFFFFFLL))
        {

          id v51 = 0;
          goto LABEL_13;
        }
        objc_msgSend_addObject_(v13, v47, (uint64_t)v28, v49, v50);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v56, (uint64_t)v60, 16);
      a5 = v21 + v20;
      if (v18) {
        continue;
      }
      break;
    }
  }

  id v51 = v13;
LABEL_13:

  return v51;
}

+ (id)_phonemeArray:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  id v8 = objc_msgSend_mutableCopy(v71, v4, v5, v6, v7);
  v72 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11, v12);
LABEL_2:
  if (objc_msgSend_length(v8, v13, v14, v15, v16))
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v21 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EFB945B0, v17, (uint64_t)&v73, (uint64_t)v77, 16);
    if (v21)
    {
      uint64_t v22 = *(void *)v74;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v74 != v22) {
            objc_enumerationMutation(&unk_1EFB945B0);
          }
          v24 = objc_msgSend_stringWithFormat_(NSString, v18, @"^%@", v19, v20, *(void *)(*((void *)&v73 + 1) + 8 * i));
          v28 = objc_msgSend__retrieveRegularExpression_(a1, v25, (uint64_t)v24, v26, v27);

          uint64_t v33 = objc_msgSend_length(v8, v29, v30, v31, v32);
          uint64_t v35 = objc_msgSend_firstMatchInString_options_range_(v28, v34, (uint64_t)v8, 0, 0, v33);
          uint64_t v40 = v35;
          if (v35)
          {
            uint64_t v41 = objc_msgSend_range(v35, v36, v37, v38, v39);
            v44 = objc_msgSend_substringWithRange_(v8, v42, v41, (uint64_t)v42, v43);
            uint64_t v45 = [TTSApplebetMapperPhonemeInfo alloc];
            uint64_t v50 = objc_msgSend_init(v45, v46, v47, v48, v49);

            objc_msgSend_setStartTime_(v50, v51, (uint64_t)&unk_1EFB954F8, v52, v53);
            objc_msgSend_setEndTime_(v50, v54, (uint64_t)&unk_1EFB954F8, v55, v56);
            objc_msgSend_setPhoneme_(v50, v57, (uint64_t)v44, v58, v59);
            objc_msgSend_addObject_(v72, v60, (uint64_t)v50, v61, v62);
            uint64_t v67 = objc_msgSend_range(v40, v63, v64, v65, v66);
            objc_msgSend_replaceCharactersInRange_withString_(v8, v68, v67, (uint64_t)v68, (uint64_t)&stru_1EFB83720);

            goto LABEL_2;
          }
        }
        id v21 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EFB945B0, v18, (uint64_t)&v73, (uint64_t)v77, 16);
        if (v21) {
          continue;
        }
        break;
      }
    }
    v69 = v72;
  }
  else
  {
    v69 = v72;
    id v21 = v72;
  }

  return v21;
}

+ (id)_phonemeRules
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A66DD340;
  block[3] = &unk_1E5C69480;
  block[4] = a1;
  if (qword_1E96C46F0 != -1) {
    dispatch_once(&qword_1E96C46F0, block);
  }
  v2 = (void *)qword_1E96C46E8;

  return v2;
}

+ (id)_acceptRule
{
  return &unk_1EFB7E538;
}

+ (id)_rightRaisingContextRule
{
  uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"^%@", v2, v3, @"((t)|(d)|(n)|(T)|(D)|(s)|(z)|(S)|(Z)|(t&S)|(d&Z)|(j)|(i)|(I))");
  v9 = objc_msgSend__retrieveRegularExpression_(a1, v6, (uint64_t)v5, v7, v8);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A66DD498;
  aBlock[3] = &unk_1E5C694C8;
  id v15 = v9;
  id v10 = v9;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = _Block_copy(v11);

  return v12;
}

+ (id)_uberRightRaisingContextRule
{
  uint64_t v5 = objc_msgSend__retrieveRegularExpression_(a1, a2, @"[h.']", v2, v3);
  v9 = objc_msgSend_stringWithFormat_(NSString, v6, @"^%@", v7, v8, @"((t)|(d)|(n)|(T)|(D)|(s)|(z)|(S)|(Z)|(t&S)|(d&Z)|(j)|(i)|(I))");
  v13 = objc_msgSend__retrieveRegularExpression_(a1, v10, (uint64_t)v9, v11, v12);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A66DD6C0;
  aBlock[3] = &unk_1E5C694F0;
  id v20 = v5;
  id v21 = v13;
  id v14 = v13;
  id v15 = v5;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = _Block_copy(v16);

  return v17;
}

+ (id)_uberUberRightRaisingContextRule
{
  uint64_t v5 = objc_msgSend__retrieveRegularExpression_(a1, a2, @"['h]", v2, v3);
  v9 = objc_msgSend_stringWithFormat_(NSString, v6, @"^%@$", v7, v8, @"((t)|(d)|(n)|(T)|(D)|(s)|(z)|(S)|(Z)|(t&S)|(d&Z)|(j)|(i)|(I))");
  v13 = objc_msgSend__retrieveRegularExpression_(a1, v10, (uint64_t)v9, v11, v12);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A66DD98C;
  aBlock[3] = &unk_1E5C694F0;
  id v20 = v5;
  id v21 = v13;
  id v14 = v13;
  id v15 = v5;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = _Block_copy(v16);

  return v17;
}

+ (id)_uberUberUberRightRaisingContextRule
{
  uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"^%@$", v2, v3, @"((t)|(d)|(n)|(T)|(D)|(s)|(z)|(S)|(Z)|(t&S)|(d&Z)|(j)|(i)|(I))");
  v9 = objc_msgSend__retrieveRegularExpression_(a1, v6, (uint64_t)v5, v7, v8);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A66DDC24;
  aBlock[3] = &unk_1E5C694C8;
  id v15 = v9;
  id v10 = v9;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = _Block_copy(v11);

  return v12;
}

+ (id)_leftRaisingContextRule
{
  uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"^%@$", v2, v3, @"((i)|(I)|(e&I)|(a&I)|(O&I)|(n)|(j)|(s)|(z))");
  v9 = objc_msgSend__retrieveRegularExpression_(a1, v6, (uint64_t)v5, v7, v8);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A66DDE18;
  aBlock[3] = &unk_1E5C694C8;
  id v15 = v9;
  id v10 = v9;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = _Block_copy(v11);

  return v12;
}

+ (id)_uberLeftRaisingContextRule
{
  uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"^%@$", v2, v3, @"((i)|(I)|(e&I)|(a&I)|(O&I)|(n)|(j)|(s)|(z))");
  v9 = objc_msgSend__retrieveRegularExpression_(a1, v6, (uint64_t)v5, v7, v8);

  v13 = objc_msgSend__retrieveRegularExpression_(a1, v10, @"[.]", v11, v12);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A66DE040;
  aBlock[3] = &unk_1E5C694F0;
  id v20 = v9;
  id v21 = v13;
  id v14 = v13;
  id v15 = v9;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = _Block_copy(v16);

  return v17;
}

+ (id)_initializeRules
{
  uint64_t v6 = MEMORY[0x1E4F1CBF0];
  v661[70] = *MEMORY[0x1E4F143B8];
  v660[0] = MEMORY[0x1E4F1CBF0];
  v660[1] = &unk_1EFB945C8;
  v660[2] = MEMORY[0x1E4F1CBF0];
  v590 = objc_msgSend__acceptRule(a1, a2, v2, v3, v4);
  v660[3] = v590;
  v660[4] = &unk_1EFB945E0;
  v589 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v660, 5, v8);
  v661[0] = v589;
  v659[0] = v6;
  v659[1] = &unk_1EFB945F8;
  v659[2] = v6;
  v588 = objc_msgSend__acceptRule(a1, v9, v10, v11, v12);
  v659[3] = v588;
  v659[4] = &unk_1EFB94610;
  v587 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v659, 5, v14);
  v661[1] = v587;
  v658[0] = v6;
  v658[1] = &unk_1EFB94628;
  v658[2] = v6;
  v586 = objc_msgSend__acceptRule(a1, v15, v16, v17, v18);
  v658[3] = v586;
  v658[4] = &unk_1EFB94640;
  v585 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v658, 5, v20);
  v661[2] = v585;
  v657[0] = v6;
  v657[1] = &unk_1EFB94658;
  v657[2] = v6;
  v584 = objc_msgSend__acceptRule(a1, v21, v22, v23, v24);
  v657[3] = v584;
  v657[4] = &unk_1EFB94670;
  v583 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)v657, 5, v26);
  v661[3] = v583;
  v656[0] = v6;
  v656[1] = &unk_1EFB94688;
  v656[2] = v6;
  v582 = objc_msgSend__acceptRule(a1, v27, v28, v29, v30);
  v656[3] = v582;
  v656[4] = &unk_1EFB946A0;
  v581 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v31, (uint64_t)v656, 5, v32);
  v661[4] = v581;
  v655[0] = v6;
  v655[1] = &unk_1EFB946B8;
  v655[2] = v6;
  v580 = objc_msgSend__acceptRule(a1, v33, v34, v35, v36);
  v655[3] = v580;
  v655[4] = &unk_1EFB946D0;
  v579 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v655, 5, v38);
  v661[5] = v579;
  v654[0] = v6;
  v654[1] = &unk_1EFB946E8;
  v654[2] = v6;
  v578 = objc_msgSend__acceptRule(a1, v39, v40, v41, v42);
  v654[3] = v578;
  v654[4] = &unk_1EFB94700;
  v577 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v43, (uint64_t)v654, 5, v44);
  v661[6] = v577;
  v653[0] = v6;
  v653[1] = &unk_1EFB94718;
  v653[2] = v6;
  v576 = objc_msgSend__acceptRule(a1, v45, v46, v47, v48);
  v653[3] = v576;
  v653[4] = &unk_1EFB94730;
  v575 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v49, (uint64_t)v653, 5, v50);
  v661[7] = v575;
  v652[0] = v6;
  v652[1] = &unk_1EFB94748;
  v652[2] = v6;
  v574 = objc_msgSend__acceptRule(a1, v51, v52, v53, v54);
  v652[3] = v574;
  v652[4] = &unk_1EFB94760;
  v573 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v55, (uint64_t)v652, 5, v56);
  v661[8] = v573;
  v651[0] = v6;
  v651[1] = &unk_1EFB94778;
  v651[2] = &unk_1EFB94790;
  v572 = objc_msgSend__acceptRule(a1, v57, v58, v59, v60);
  v651[3] = v572;
  v651[4] = &unk_1EFB947A8;
  v571 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v61, (uint64_t)v651, 5, v62);
  v661[9] = v571;
  v650[0] = v6;
  v650[1] = &unk_1EFB947C0;
  v650[2] = &unk_1EFB947D8;
  v570 = objc_msgSend__acceptRule(a1, v63, v64, v65, v66);
  v650[3] = v570;
  v650[4] = &unk_1EFB947F0;
  v569 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v67, (uint64_t)v650, 5, v68);
  v661[10] = v569;
  v649[0] = v6;
  v649[1] = &unk_1EFB94808;
  v649[2] = &unk_1EFB94820;
  v568 = objc_msgSend__acceptRule(a1, v69, v70, v71, v72);
  v649[3] = v568;
  v649[4] = &unk_1EFB94838;
  v567 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v73, (uint64_t)v649, 5, v74);
  v661[11] = v567;
  v648[0] = v6;
  v648[1] = &unk_1EFB94850;
  v648[2] = &unk_1EFB94868;
  v566 = objc_msgSend__acceptRule(a1, v75, v76, v77, v78);
  v648[3] = v566;
  v648[4] = &unk_1EFB94880;
  v565 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v79, (uint64_t)v648, 5, v80);
  v661[12] = v565;
  v647[0] = v6;
  v647[1] = &unk_1EFB94898;
  v647[2] = &unk_1EFB948B0;
  v564 = objc_msgSend__acceptRule(a1, v81, v82, v83, v84);
  v647[3] = v564;
  v647[4] = &unk_1EFB948C8;
  v563 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v85, (uint64_t)v647, 5, v86);
  v661[13] = v563;
  v646[0] = v6;
  v646[1] = &unk_1EFB948E0;
  v646[2] = v6;
  v562 = objc_msgSend__acceptRule(a1, v87, v88, v89, v90);
  v646[3] = v562;
  v646[4] = &unk_1EFB948F8;
  v561 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v91, (uint64_t)v646, 5, v92);
  v661[14] = v561;
  v645[0] = v6;
  v645[1] = &unk_1EFB94910;
  v645[2] = &unk_1EFB94928;
  v560 = objc_msgSend__acceptRule(a1, v93, v94, v95, v96);
  v645[3] = v560;
  v645[4] = &unk_1EFB94940;
  v559 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v97, (uint64_t)v645, 5, v98);
  v661[15] = v559;
  v644[0] = v6;
  v644[1] = &unk_1EFB94958;
  v644[2] = &unk_1EFB94970;
  v558 = objc_msgSend__rightRaisingContextRule(a1, v99, v100, v101, v102);
  v644[3] = v558;
  v644[4] = &unk_1EFB94988;
  v557 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v103, (uint64_t)v644, 5, v104);
  v661[16] = v557;
  v643[0] = v6;
  v643[1] = &unk_1EFB949A0;
  v643[2] = &unk_1EFB949B8;
  v556 = objc_msgSend__uberRightRaisingContextRule(a1, v105, v106, v107, v108);
  v643[3] = v556;
  v643[4] = &unk_1EFB949D0;
  v555 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v109, (uint64_t)v643, 5, v110);
  v661[17] = v555;
  v642[0] = v6;
  v642[1] = &unk_1EFB949E8;
  v642[2] = &unk_1EFB94A00;
  v554 = objc_msgSend__uberUberRightRaisingContextRule(a1, v111, v112, v113, v114);
  v642[3] = v554;
  v642[4] = &unk_1EFB94A18;
  v553 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v115, (uint64_t)v642, 5, v116);
  v661[18] = v553;
  v641[0] = v6;
  v641[1] = &unk_1EFB94A30;
  v641[2] = &unk_1EFB94A48;
  v552 = objc_msgSend__uberUberUberRightRaisingContextRule(a1, v117, v118, v119, v120);
  v641[3] = v552;
  v641[4] = &unk_1EFB94A60;
  v551 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v121, (uint64_t)v641, 5, v122);
  v661[19] = v551;
  v640[0] = &unk_1EFB94A78;
  v640[1] = &unk_1EFB94A90;
  v640[2] = &unk_1EFB94AA8;
  v550 = objc_msgSend__leftRaisingContextRule(a1, v123, v124, v125, v126);
  v640[3] = v550;
  v640[4] = &unk_1EFB94AC0;
  v549 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v127, (uint64_t)v640, 5, v128);
  v661[20] = v549;
  v639[0] = &unk_1EFB94AD8;
  v639[1] = &unk_1EFB94AF0;
  v639[2] = &unk_1EFB94B08;
  v548 = objc_msgSend__uberLeftRaisingContextRule(a1, v129, v130, v131, v132);
  v639[3] = v548;
  v639[4] = &unk_1EFB94B20;
  v547 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v133, (uint64_t)v639, 5, v134);
  v661[21] = v547;
  v638[0] = v6;
  v638[1] = &unk_1EFB94B38;
  v638[2] = v6;
  v546 = objc_msgSend__acceptRule(a1, v135, v136, v137, v138);
  v638[3] = v546;
  v638[4] = &unk_1EFB94B50;
  v545 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v139, (uint64_t)v638, 5, v140);
  v661[22] = v545;
  v637[0] = v6;
  v637[1] = &unk_1EFB94B68;
  v637[2] = v6;
  v544 = objc_msgSend__acceptRule(a1, v141, v142, v143, v144);
  v637[3] = v544;
  v637[4] = &unk_1EFB94B80;
  v543 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v145, (uint64_t)v637, 5, v146);
  v661[23] = v543;
  v636[0] = v6;
  v636[1] = &unk_1EFB94B98;
  v636[2] = v6;
  v542 = objc_msgSend__acceptRule(a1, v147, v148, v149, v150);
  v636[3] = v542;
  v636[4] = &unk_1EFB94BB0;
  v541 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v151, (uint64_t)v636, 5, v152);
  v661[24] = v541;
  v635[0] = v6;
  v635[1] = &unk_1EFB94BC8;
  v635[2] = v6;
  v540 = objc_msgSend__acceptRule(a1, v153, v154, v155, v156);
  v635[3] = v540;
  v635[4] = &unk_1EFB94BE0;
  v539 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v157, (uint64_t)v635, 5, v158);
  v661[25] = v539;
  v634[0] = v6;
  v634[1] = &unk_1EFB94BF8;
  v634[2] = v6;
  v538 = objc_msgSend__acceptRule(a1, v159, v160, v161, v162);
  v634[3] = v538;
  v634[4] = &unk_1EFB94C10;
  v537 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v163, (uint64_t)v634, 5, v164);
  v661[26] = v537;
  v633[0] = v6;
  v633[1] = &unk_1EFB94C28;
  v536 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v165, v166, v167, v168);
  v633[2] = v536;
  v535 = objc_msgSend__acceptRule(a1, v169, v170, v171, v172);
  v633[3] = v535;
  v633[4] = &unk_1EFB94C40;
  v534 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v173, (uint64_t)v633, 5, v174);
  v661[27] = v534;
  v632[0] = v6;
  v632[1] = &unk_1EFB94C58;
  v533 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v175, v176, v177, v178);
  v632[2] = v533;
  v532 = objc_msgSend__acceptRule(a1, v179, v180, v181, v182);
  v632[3] = v532;
  v632[4] = &unk_1EFB94C70;
  v531 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v183, (uint64_t)v632, 5, v184);
  v661[28] = v531;
  v631[0] = v6;
  v631[1] = &unk_1EFB94C88;
  v530 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v185, v186, v187, v188);
  v631[2] = v530;
  v529 = objc_msgSend__acceptRule(a1, v189, v190, v191, v192);
  v631[3] = v529;
  v631[4] = &unk_1EFB94CA0;
  v528 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v193, (uint64_t)v631, 5, v194);
  v661[29] = v528;
  v630[0] = v6;
  v630[1] = &unk_1EFB94CB8;
  v527 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v195, v196, v197, v198);
  v630[2] = v527;
  v526 = objc_msgSend__acceptRule(a1, v199, v200, v201, v202);
  v630[3] = v526;
  v630[4] = &unk_1EFB94CD0;
  v525 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v203, (uint64_t)v630, 5, v204);
  v661[30] = v525;
  v629[0] = v6;
  v629[1] = &unk_1EFB94CE8;
  v629[2] = v6;
  v524 = objc_msgSend__acceptRule(a1, v205, v206, v207, v208);
  v629[3] = v524;
  v629[4] = &unk_1EFB94D00;
  v523 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v209, (uint64_t)v629, 5, v210);
  v661[31] = v523;
  v628[0] = v6;
  v628[1] = &unk_1EFB94D18;
  v628[2] = v6;
  v522 = objc_msgSend__acceptRule(a1, v211, v212, v213, v214);
  v628[3] = v522;
  v628[4] = &unk_1EFB94D30;
  v521 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v215, (uint64_t)v628, 5, v216);
  v661[32] = v521;
  v627[0] = v6;
  v627[1] = &unk_1EFB94D48;
  v627[2] = v6;
  v520 = objc_msgSend__acceptRule(a1, v217, v218, v219, v220);
  v627[3] = v520;
  v627[4] = &unk_1EFB94D60;
  v519 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v221, (uint64_t)v627, 5, v222);
  v661[33] = v519;
  v626[0] = v6;
  v626[1] = &unk_1EFB94D78;
  v626[2] = v6;
  v518 = objc_msgSend__acceptRule(a1, v223, v224, v225, v226);
  v626[3] = v518;
  v626[4] = &unk_1EFB94D90;
  v517 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v227, (uint64_t)v626, 5, v228);
  v661[34] = v517;
  v625[0] = v6;
  v625[1] = &unk_1EFB94DA8;
  v625[2] = v6;
  v516 = objc_msgSend__acceptRule(a1, v229, v230, v231, v232);
  v625[3] = v516;
  v625[4] = &unk_1EFB94DC0;
  v515 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v233, (uint64_t)v625, 5, v234);
  v661[35] = v515;
  v624[0] = v6;
  v624[1] = &unk_1EFB94DD8;
  v624[2] = v6;
  v514 = objc_msgSend__acceptRule(a1, v235, v236, v237, v238);
  v624[3] = v514;
  v624[4] = &unk_1EFB94DF0;
  v513 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v239, (uint64_t)v624, 5, v240);
  v661[36] = v513;
  v623[0] = v6;
  v623[1] = &unk_1EFB94E08;
  v623[2] = v6;
  v512 = objc_msgSend__acceptRule(a1, v241, v242, v243, v244);
  v623[3] = v512;
  v623[4] = &unk_1EFB94E20;
  v511 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v245, (uint64_t)v623, 5, v246);
  v661[37] = v511;
  v622[0] = v6;
  v622[1] = &unk_1EFB94E38;
  v622[2] = v6;
  v510 = objc_msgSend__acceptRule(a1, v247, v248, v249, v250);
  v622[3] = v510;
  v622[4] = &unk_1EFB94E50;
  v509 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v251, (uint64_t)v622, 5, v252);
  v661[38] = v509;
  v621[0] = v6;
  v621[1] = &unk_1EFB94E68;
  v621[2] = v6;
  v508 = objc_msgSend__acceptRule(a1, v253, v254, v255, v256);
  v621[3] = v508;
  v621[4] = &unk_1EFB94E80;
  v507 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v257, (uint64_t)v621, 5, v258);
  v661[39] = v507;
  v620[0] = v6;
  v620[1] = &unk_1EFB94E98;
  v620[2] = v6;
  v506 = objc_msgSend__acceptRule(a1, v259, v260, v261, v262);
  v620[3] = v506;
  v620[4] = &unk_1EFB94EB0;
  v505 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v263, (uint64_t)v620, 5, v264);
  v661[40] = v505;
  v619[0] = v6;
  v619[1] = &unk_1EFB94EC8;
  v619[2] = v6;
  v504 = objc_msgSend__acceptRule(a1, v265, v266, v267, v268);
  v619[3] = v504;
  v619[4] = &unk_1EFB94EE0;
  v503 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v269, (uint64_t)v619, 5, v270);
  v661[41] = v503;
  v618[0] = v6;
  v618[1] = &unk_1EFB94EF8;
  v618[2] = v6;
  v502 = objc_msgSend__acceptRule(a1, v271, v272, v273, v274);
  v618[3] = v502;
  v618[4] = &unk_1EFB94F10;
  v501 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v275, (uint64_t)v618, 5, v276);
  v661[42] = v501;
  v617[0] = v6;
  v617[1] = &unk_1EFB94F28;
  v617[2] = v6;
  v500 = objc_msgSend__acceptRule(a1, v277, v278, v279, v280);
  v617[3] = v500;
  v617[4] = &unk_1EFB94F40;
  v499 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v281, (uint64_t)v617, 5, v282);
  v661[43] = v499;
  v616[0] = v6;
  v616[1] = &unk_1EFB94F58;
  v616[2] = v6;
  v498 = objc_msgSend__acceptRule(a1, v283, v284, v285, v286);
  v616[3] = v498;
  v616[4] = &unk_1EFB94F70;
  v497 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v287, (uint64_t)v616, 5, v288);
  v661[44] = v497;
  v615[0] = v6;
  v615[1] = &unk_1EFB94F88;
  v615[2] = v6;
  v496 = objc_msgSend__acceptRule(a1, v289, v290, v291, v292);
  v615[3] = v496;
  v615[4] = &unk_1EFB94FA0;
  v495 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v293, (uint64_t)v615, 5, v294);
  v661[45] = v495;
  v614[0] = v6;
  v614[1] = &unk_1EFB94FB8;
  v614[2] = v6;
  v494 = objc_msgSend__acceptRule(a1, v295, v296, v297, v298);
  v614[3] = v494;
  v614[4] = &unk_1EFB94FD0;
  v493 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v299, (uint64_t)v614, 5, v300);
  v661[46] = v493;
  v613[0] = v6;
  v613[1] = &unk_1EFB94FE8;
  v613[2] = v6;
  v492 = objc_msgSend__acceptRule(a1, v301, v302, v303, v304);
  v613[3] = v492;
  v613[4] = &unk_1EFB95000;
  v491 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v305, (uint64_t)v613, 5, v306);
  v661[47] = v491;
  v612[0] = v6;
  v612[1] = &unk_1EFB95018;
  v612[2] = v6;
  v490 = objc_msgSend__acceptRule(a1, v307, v308, v309, v310);
  v612[3] = v490;
  v612[4] = &unk_1EFB95030;
  v489 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v311, (uint64_t)v612, 5, v312);
  v661[48] = v489;
  v611[0] = v6;
  v611[1] = &unk_1EFB95048;
  v611[2] = v6;
  v488 = objc_msgSend__acceptRule(a1, v313, v314, v315, v316);
  v611[3] = v488;
  v611[4] = &unk_1EFB95060;
  v487 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v317, (uint64_t)v611, 5, v318);
  v661[49] = v487;
  v610[0] = v6;
  v610[1] = &unk_1EFB95078;
  v610[2] = v6;
  v486 = objc_msgSend__acceptRule(a1, v319, v320, v321, v322);
  v610[3] = v486;
  v610[4] = &unk_1EFB95090;
  v485 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v323, (uint64_t)v610, 5, v324);
  v661[50] = v485;
  v609[0] = v6;
  v609[1] = &unk_1EFB950A8;
  v609[2] = v6;
  v484 = objc_msgSend__acceptRule(a1, v325, v326, v327, v328);
  v609[3] = v484;
  v609[4] = &unk_1EFB950C0;
  v483 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v329, (uint64_t)v609, 5, v330);
  v661[51] = v483;
  v608[0] = v6;
  v608[1] = &unk_1EFB950D8;
  v608[2] = v6;
  v482 = objc_msgSend__acceptRule(a1, v331, v332, v333, v334);
  v608[3] = v482;
  v608[4] = &unk_1EFB950F0;
  v481 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v335, (uint64_t)v608, 5, v336);
  v661[52] = v481;
  v607[0] = v6;
  v607[1] = &unk_1EFB95108;
  v607[2] = v6;
  v480 = objc_msgSend__acceptRule(a1, v337, v338, v339, v340);
  v607[3] = v480;
  v607[4] = &unk_1EFB95120;
  v479 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v341, (uint64_t)v607, 5, v342);
  v661[53] = v479;
  v606[0] = v6;
  v606[1] = &unk_1EFB95138;
  v606[2] = v6;
  v478 = objc_msgSend__acceptRule(a1, v343, v344, v345, v346);
  v606[3] = v478;
  v606[4] = &unk_1EFB95150;
  v477 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v347, (uint64_t)v606, 5, v348);
  v661[54] = v477;
  v605[0] = v6;
  v605[1] = &unk_1EFB95168;
  v605[2] = v6;
  v476 = objc_msgSend__acceptRule(a1, v349, v350, v351, v352);
  v605[3] = v476;
  v605[4] = &unk_1EFB95180;
  v475 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v353, (uint64_t)v605, 5, v354);
  v661[55] = v475;
  v604[0] = v6;
  v604[1] = &unk_1EFB95198;
  v604[2] = v6;
  v474 = objc_msgSend__acceptRule(a1, v355, v356, v357, v358);
  v604[3] = v474;
  v604[4] = &unk_1EFB951B0;
  v473 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v359, (uint64_t)v604, 5, v360);
  v661[56] = v473;
  v603[0] = v6;
  v603[1] = &unk_1EFB951C8;
  v603[2] = v6;
  v472 = objc_msgSend__acceptRule(a1, v361, v362, v363, v364);
  v603[3] = v472;
  v603[4] = &unk_1EFB951E0;
  v471 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v365, (uint64_t)v603, 5, v366);
  v661[57] = v471;
  v602[0] = v6;
  v602[1] = &unk_1EFB951F8;
  v602[2] = v6;
  v470 = objc_msgSend__acceptRule(a1, v367, v368, v369, v370);
  v602[3] = v470;
  v602[4] = &unk_1EFB95210;
  v469 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v371, (uint64_t)v602, 5, v372);
  v661[58] = v469;
  v601[0] = v6;
  v601[1] = &unk_1EFB95228;
  v601[2] = v6;
  v468 = objc_msgSend__acceptRule(a1, v373, v374, v375, v376);
  v601[3] = v468;
  v601[4] = &unk_1EFB95240;
  v467 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v377, (uint64_t)v601, 5, v378);
  v661[59] = v467;
  v600[0] = v6;
  v600[1] = &unk_1EFB95258;
  v600[2] = v6;
  v466 = objc_msgSend__acceptRule(a1, v379, v380, v381, v382);
  v600[3] = v466;
  v600[4] = &unk_1EFB95270;
  v465 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v383, (uint64_t)v600, 5, v384);
  v661[60] = v465;
  v599[0] = v6;
  v599[1] = &unk_1EFB95288;
  v599[2] = v6;
  v464 = objc_msgSend__acceptRule(a1, v385, v386, v387, v388);
  v599[3] = v464;
  v599[4] = &unk_1EFB952A0;
  v463 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v389, (uint64_t)v599, 5, v390);
  v661[61] = v463;
  v598[0] = v6;
  v598[1] = &unk_1EFB952B8;
  v598[2] = v6;
  v462 = objc_msgSend__acceptRule(a1, v391, v392, v393, v394);
  v598[3] = v462;
  v598[4] = &unk_1EFB952D0;
  v461 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v395, (uint64_t)v598, 5, v396);
  v661[62] = v461;
  v597[0] = v6;
  v597[1] = &unk_1EFB952E8;
  v597[2] = v6;
  v460 = objc_msgSend__acceptRule(a1, v397, v398, v399, v400);
  v597[3] = v460;
  v597[4] = &unk_1EFB95300;
  v459 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v401, (uint64_t)v597, 5, v402);
  v661[63] = v459;
  v596[0] = v6;
  v596[1] = &unk_1EFB95318;
  v596[2] = v6;
  v458 = objc_msgSend__acceptRule(a1, v403, v404, v405, v406);
  v596[3] = v458;
  v596[4] = &unk_1EFB95330;
  v457 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v407, (uint64_t)v596, 5, v408);
  v661[64] = v457;
  v595[0] = v6;
  v595[1] = &unk_1EFB95348;
  v595[2] = v6;
  v456 = objc_msgSend__acceptRule(a1, v409, v410, v411, v412);
  v595[3] = v456;
  v595[4] = &unk_1EFB95360;
  v415 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v413, (uint64_t)v595, 5, v414);
  v661[65] = v415;
  v594[0] = v6;
  v594[1] = &unk_1EFB95378;
  v594[2] = v6;
  v420 = objc_msgSend__acceptRule(a1, v416, v417, v418, v419);
  v594[3] = v420;
  v594[4] = &unk_1EFB95390;
  v423 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v421, (uint64_t)v594, 5, v422);
  v661[66] = v423;
  v593[0] = v6;
  v593[1] = &unk_1EFB953A8;
  v593[2] = v6;
  v428 = objc_msgSend__acceptRule(a1, v424, v425, v426, v427);
  v593[3] = v428;
  v593[4] = &unk_1EFB953C0;
  v431 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v429, (uint64_t)v593, 5, v430);
  v661[67] = v431;
  v592[0] = v6;
  v592[1] = &unk_1EFB953D8;
  v592[2] = v6;
  v436 = objc_msgSend__acceptRule(a1, v432, v433, v434, v435);
  v592[3] = v436;
  v592[4] = &unk_1EFB953F0;
  v439 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v437, (uint64_t)v592, 5, v438);
  v661[68] = v439;
  v591[0] = v6;
  v591[1] = &unk_1EFB95408;
  v591[2] = v6;
  v444 = objc_msgSend__acceptRule(a1, v440, v441, v442, v443);
  v591[3] = v444;
  v591[4] = &unk_1EFB95420;
  v447 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v445, (uint64_t)v591, 5, v446);
  v661[69] = v447;
  v455 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v448, (uint64_t)v661, 70, v449);

  v453 = objc_msgSend_ax_mappedArrayUsingBlock_(v455, v450, (uint64_t)&unk_1EFB7E518, v451, v452);

  return v453;
}

+ (id)_phonoTranslation:(id)a3
{
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  id v195 = a3;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7);
  id v194 = (id)objc_claimAutoreleasedReturnValue();
  id v191 = a1;
  uint64_t v188 = objc_msgSend__phonemeRules(a1, v8, v9, v10, v11);
  uint64_t v198 = 0;
  while (objc_msgSend_count(v195, v12, v13, v14, v15, v188) > (unint64_t)(int)v198)
  {
    long long v202 = 0u;
    long long v203 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    id obj = v188;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v200, (uint64_t)v204, 16);
    if (!v17)
    {

      goto LABEL_43;
    }
    char v22 = 0;
    uint64_t v196 = v17;
    uint64_t v197 = *(void *)v201;
    unsigned int v199 = -1;
    do
    {
      for (uint64_t i = 0; i != v196; ++i)
      {
        if (*(void *)v201 != v197) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v200 + 1) + 8 * i);
        uint64_t v25 = objc_msgSend_left(v24, v18, v19, v20, v21);
        uint64_t v30 = objc_msgSend_match(v24, v26, v27, v28, v29);
        uint64_t v35 = objc_msgSend_right(v24, v31, v32, v33, v34);
        objc_msgSend_matchRule(v24, v36, v37, v38, v39);
        uint64_t v40 = (uint64_t (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        uint64_t v45 = objc_msgSend_substitution(v24, v41, v42, v43, v44);
        objc_opt_class();
        ++v199;
        if (objc_opt_isKindOfClass())
        {
          if ((int)v198 > 0) {
            goto LABEL_15;
          }
        }
        else if (objc_msgSend_count(v25, v46, v47, v48, v49) > (unint64_t)(int)v198)
        {
          goto LABEL_15;
        }
        int v50 = objc_msgSend_count(v195, v46, v47, v48, v49);
        int v59 = v50 - v198 - objc_msgSend_count(v30, v51, v52, v53, v54);
        if (v59 < 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (objc_msgSend_count(v35, v55, v56, v57, v58) > (unint64_t)v59)
          {
LABEL_15:
            int v60 = 5;
            goto LABEL_37;
          }
        }
        else if (v59)
        {
          goto LABEL_15;
        }
        uint64_t v192 = objc_msgSend__phonoMatch_match_matchpos_count_(v191, v55, (uint64_t)v195, (uint64_t)v30, v198, v199);
        if (v192)
        {
          int v65 = objc_msgSend_count(v25, v61, v62, v63, v64);
          uint64_t v190 = objc_msgSend__phonoMatch_match_matchpos_count_(v191, v66, (uint64_t)v195, (uint64_t)v25, (v198 - v65), v199);
          if (v190)
          {
            int v71 = objc_msgSend_count(v30, v67, v68, v69, v70);
            uint64_t v73 = objc_msgSend__phonoMatch_match_matchpos_count_(v191, v72, (uint64_t)v195, (uint64_t)v35, (v198 + v71), v199);
            v189 = (void *)v73;
            if (v73
              && (((uint64_t (**)(void, void *, void *, uint64_t))v40)[2](v40, v190, v192, v73) & 1) != 0)
            {
              uint64_t v77 = objc_msgSend_objectAtIndexedSubscript_(v195, v74, (int)v198, v75, v76);
              uint64_t v82 = objc_msgSend_startTime(v77, v78, v79, v80, v81);
              objc_msgSend_floatValue(v82, v83, v84, v85, v86);
              float v88 = v87;

              uint64_t v93 = objc_msgSend_count(v30, v89, v90, v91, v92);
              v97 = objc_msgSend_objectAtIndexedSubscript_(v195, v94, (int)v198 + v93 - 1, v95, v96);
              uint64_t v102 = objc_msgSend_endTime(v97, v98, v99, v100, v101);
              objc_msgSend_floatValue(v102, v103, v104, v105, v106);
              float v108 = v107;

              int v113 = objc_msgSend_count(v30, v109, v110, v111, v112);
              uint64_t v122 = objc_msgSend_mutableCopy(v45, v114, v115, v116, v117);
              float v123 = v108 - v88;
              uint64_t v198 = (v198 + v113);
              float v124 = v108 - v88;
              while (objc_msgSend_count(v122, v118, v119, v120, v121))
              {
                v129 = objc_msgSend_firstObject(v122, v125, v126, v127, v128);
                objc_msgSend_removeObjectAtIndex_(v122, v130, 0, v131, v132);
                if (objc_msgSend_count(v122, v133, v134, v135, v136))
                {
                  v141 = objc_msgSend_firstObject(v122, v137, v138, v139, v140);
                  objc_msgSend_floatValue(v141, v142, v143, v144, v145);
                  float v147 = v146;

                  objc_msgSend_removeObjectAtIndex_(v122, v148, 0, v149, v150);
                }
                else
                {
                  float v147 = 0.0;
                }
                if (objc_msgSend_count(v122, v137, v138, v139, v140)) {
                  float v151 = v123 * v147;
                }
                else {
                  float v151 = v124;
                }
                uint64_t v152 = [TTSApplebetMapperPhonemeInfo alloc];
                v157 = objc_msgSend_init(v152, v153, v154, v155, v156);

                *(float *)&double v158 = v88;
                v163 = objc_msgSend_numberWithFloat_(NSNumber, v159, v160, v161, v162, v158);
                objc_msgSend_setStartTime_(v157, v164, (uint64_t)v163, v165, v166);

                float v167 = v151 + 0.5;
                float v88 = v88 + v167;
                *(float *)&double v168 = v88;
                v173 = objc_msgSend_numberWithFloat_(NSNumber, v169, v170, v171, v172, v168);
                objc_msgSend_setEndTime_(v157, v174, (uint64_t)v173, v175, v176);

                objc_msgSend_setPhoneme_(v157, v177, (uint64_t)v129, v178, v179);
                objc_msgSend_addObject_(v194, v180, (uint64_t)v157, v181, v182);

                float v124 = v124 - v167;
              }

              char v22 = 1;
              int v60 = 4;
            }
            else
            {
              int v60 = 5;
            }
          }
          else
          {
            int v60 = 5;
          }
        }
        else
        {
          int v60 = 5;
        }

LABEL_37:
        if (v60 != 5) {
          goto LABEL_40;
        }
      }
      uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v200, (uint64_t)v204, 16);
    }
    while (v196);
LABEL_40:

    if ((v22 & 1) == 0)
    {
LABEL_43:
      v183 = objc_msgSend_objectAtIndexedSubscript_(v195, v12, (int)v198, v14, v15);
      objc_msgSend_addObject_(v194, v184, (uint64_t)v183, v185, v186);

      uint64_t v198 = (v198 + 1);
    }
  }

  return v194;
}

+ (id)convertLHToApplebet:(id)a3
{
  v128[1] = *MEMORY[0x1E4F143B8];
  id v119 = a3;
  uint64_t v120 = objc_msgSend__phonemeArray_(a1, v5, (uint64_t)v119, v6, v7);
  if (objc_msgSend_count(v120, v8, v9, v10, v11))
  {
    uint64_t v15 = objc_msgSend__phonoTranslation_(a1, v12, (uint64_t)v120, v13, v14);
    int v20 = objc_msgSend_count(v15, v16, v17, v18, v19);
    int v25 = v20;
    if (v20 >= 1)
    {
      SEL v118 = a2;
      uint64_t v26 = 0;
      uint64_t v121 = v20;
      do
      {
        uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(v15, v21, v26, v23, v24);
        uint64_t v122 = objc_msgSend_phoneme(v27, v28, v29, v30, v31);

        if ((objc_msgSend_isEqualToString_(v122, v32, @"1", v33, v34) & 1) != 0
          || (objc_msgSend_isEqualToString_(v122, v35, @"2", v37, v38) & 1) != 0)
        {
          uint64_t v39 = v26 + 1;
          if ((int)v26 + 1 >= v25)
          {
            LODWORD(v40) = v26 + 1;
          }
          else
          {
            uint64_t v40 = (int)v39;
            while (1)
            {
              uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(v15, v35, v40, v37, v38);
              uint64_t v46 = objc_msgSend_phoneme(v41, v42, v43, v44, v45);

              int v50 = objc_msgSend__retrieveRegularExpression_(a1, v47, @"((AE)|(EY)|(AO)|(AX)|(IY)|(EH)|(IH)|(AY)|(IX)|(AA)|(UW)|(UH)|(UX)|(OW)|(AW)|(OY))", v48, v49);
              uint64_t v55 = objc_msgSend_length(v46, v51, v52, v53, v54);
              uint64_t v57 = objc_msgSend_firstMatchInString_options_range_(v50, v56, (uint64_t)v46, 0, 0, v55);
              uint64_t v62 = v57;
              if (v57)
              {
                if (objc_msgSend_range(v57, v58, v59, v60, v61) != 0x7FFFFFFFFFFFFFFFLL) {
                  break;
                }
              }

              if ((int)++v40 >= v25) {
                goto LABEL_15;
              }
            }
          }
LABEL_15:
          int v65 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v35, v36, v37, v38);
          if (v26)
          {
            uint64_t v66 = objc_msgSend_subarrayWithRange_(v15, v63, 0, v26, v64);
          }
          else
          {
            uint64_t v66 = (void *)MEMORY[0x1E4F1CBF0];
          }
          uint64_t v67 = (v40 + ~v26);
          if ((int)v67 < 1)
          {
            uint64_t v68 = (void *)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            uint64_t v68 = objc_msgSend_subarrayWithRange_(v15, v63, v26 + 1, v67, v64);
          }
          uint64_t v69 = objc_msgSend_objectAtIndex_(v15, v63, v26, v67, v64);
          v128[0] = v69;
          uint64_t v72 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v70, (uint64_t)v128, 1, v71);

          uint64_t v75 = objc_msgSend_subarrayWithRange_(v15, v73, (int)v40, v25 - (int)v40, v74);
          objc_msgSend_addObjectsFromArray_(v65, v76, (uint64_t)v66, v77, v78);
          objc_msgSend_addObjectsFromArray_(v65, v79, (uint64_t)v68, v80, v81);
          objc_msgSend_addObjectsFromArray_(v65, v82, (uint64_t)v72, v83, v84);
          objc_msgSend_addObjectsFromArray_(v65, v85, (uint64_t)v75, v86, v87);
          uint64_t v92 = objc_msgSend_count(v15, v88, v89, v90, v91);
          if (v92 != objc_msgSend_count(v65, v93, v94, v95, v96))
          {
            uint64_t v101 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v97, v98, v99, v100);
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v101, v102, (uint64_t)v118, (uint64_t)a1, @"TTSLHPhonemeToApplebetPhonemeMapper.mm", 680, @"updated phonemes and xlatedPhonemesArray");
          }
          uint64_t v26 = v39;
          uint64_t v15 = v65;
        }
        else
        {
          ++v26;
        }
      }
      while (v26 != v121);
    }
    objc_msgSend_string(MEMORY[0x1E4F28E78], v21, v22, v23, v24);
    id v103 = (id)objc_claimAutoreleasedReturnValue();
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v104 = v15;
    uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v123, (uint64_t)v127, 16);
    if (v110)
    {
      uint64_t v111 = *(void *)v124;
      do
      {
        for (uint64_t i = 0; i != v110; ++i)
        {
          if (*(void *)v124 != v111) {
            objc_enumerationMutation(v104);
          }
          int v113 = objc_msgSend_phoneme(*(void **)(*((void *)&v123 + 1) + 8 * i), v106, v107, v108, v109);
          objc_msgSend_appendString_(v103, v114, (uint64_t)v113, v115, v116);
        }
        uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v106, (uint64_t)&v123, (uint64_t)v127, 16);
      }
      while (v110);
    }
  }
  else
  {
    id v103 = v119;
  }

  return v103;
}

@end