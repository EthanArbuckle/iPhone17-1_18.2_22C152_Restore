@interface PAAudiogramUtilities
+ ($85CD2974BE96D4886BB301820D1C36C2)entryFromData:(id)a3 atIndex:(unsigned int)a4;
+ (id)frequencyDictionaryFromOffsets:(id)a3;
+ (id)normalizedOffsetsFromAudiogram:(id)a3;
+ (id)normalizedOffsetsFromLeftOffsets:(id)a3 andRightOffsets:(id)a4;
+ (id)offsetsSortedByFrequency:(id)a3;
+ (id)presetFrequencies;
+ (id)ptaFrequencies;
@end

@implementation PAAudiogramUtilities

+ ($85CD2974BE96D4886BB301820D1C36C2)entryFromData:(id)a3 atIndex:(unsigned int)a4
{
  $85CD2974BE96D4886BB301820D1C36C2 v5 = 0;
  objc_msgSend(a3, "getBytes:range:", &v5, 8 * (a4 + 3) + 12, 8);
  return v5;
}

+ (id)presetFrequencies
{
  v2 = (void *)presetFrequencies_presetFrequencies;
  if (!presetFrequencies_presetFrequencies)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", &unk_26C1E9E88, &unk_26C1E9E98, &unk_26C1E9EA8, &unk_26C1E9EB8, &unk_26C1E9EC8, &unk_26C1E9ED8, &unk_26C1E9EE8, &unk_26C1E9EF8, 0);
    v4 = (void *)presetFrequencies_presetFrequencies;
    presetFrequencies_presetFrequencies = v3;

    v2 = (void *)presetFrequencies_presetFrequencies;
  }
  return v2;
}

+ (id)ptaFrequencies
{
  v2 = (void *)ptaFrequencies_presetFrequencies;
  if (!ptaFrequencies_presetFrequencies)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", &unk_26C1E9E98, &unk_26C1E9EA8, &unk_26C1E9EB8, &unk_26C1E9ED8, 0);
    v4 = (void *)ptaFrequencies_presetFrequencies;
    ptaFrequencies_presetFrequencies = v3;

    v2 = (void *)ptaFrequencies_presetFrequencies;
  }
  return v2;
}

+ (id)normalizedOffsetsFromAudiogram:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
    id v4 = a3;
    $85CD2974BE96D4886BB301820D1C36C2 v5 = [v3 dictionary];
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = [v4 sensitivityPoints];

    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __55__PAAudiogramUtilities_normalizedOffsetsFromAudiogram___block_invoke;
    v15 = &unk_264103578;
    id v16 = v5;
    id v17 = v6;
    id v8 = v6;
    id v9 = v5;
    [v7 enumerateObjectsUsingBlock:&v12];

    v10 = +[PAAudiogramUtilities normalizedOffsetsFromLeftOffsets:andRightOffsets:](PAAudiogramUtilities, "normalizedOffsetsFromLeftOffsets:andRightOffsets:", v9, v8, v12, v13, v14, v15);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

void __55__PAAudiogramUtilities_normalizedOffsetsFromAudiogram___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 frequency];
  $85CD2974BE96D4886BB301820D1C36C2 v5 = [getHKUnitClass() hertzUnit];
  [v4 doubleValueForUnit:v5];
  double v7 = v6;

  id v21 = [v3 leftEarSensitivity];
  id v8 = [v3 rightEarSensitivity];

  id v9 = [getHKUnitClass() decibelHearingLevelUnit];
  [v21 doubleValueForUnit:v9];
  double v11 = v10;

  uint64_t v12 = [getHKUnitClass() decibelHearingLevelUnit];
  [v8 doubleValueForUnit:v12];
  double v14 = v13;

  v15 = *(void **)(a1 + 32);
  id v16 = [NSNumber numberWithDouble:v11];
  id v17 = [NSNumber numberWithDouble:v7];
  [v15 setObject:v16 forKey:v17];

  v18 = *(void **)(a1 + 40);
  v19 = [NSNumber numberWithDouble:v14];
  v20 = [NSNumber numberWithDouble:v7];
  [v18 setObject:v19 forKey:v20];
}

+ (id)normalizedOffsetsFromLeftOffsets:(id)a3 andRightOffsets:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  id v9 = +[PAAudiogramUtilities presetFrequencies];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke;
  v50[3] = &unk_2641035A0;
  id v10 = v8;
  id v51 = v10;
  [v9 enumerateObjectsUsingBlock:v50];

  uint64_t v46 = 0;
  v47 = (double *)&v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  v43 = (double *)&v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_168;
  v41[3] = &unk_2641035C8;
  v41[4] = &v46;
  [v5 enumerateKeysAndObjectsUsingBlock:v41];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_2;
  v40[3] = &unk_2641035C8;
  v40[4] = &v42;
  [v6 enumerateKeysAndObjectsUsingBlock:v40];
  double v11 = +[PAAudiogramUtilities ptaFrequencies];
  unint64_t v12 = [v11 count];

  double v13 = v47;
  v47[3] = v47[3] / (double)v12;
  double v14 = v43[3] / (double)v12;
  v43[3] = v14;
  double v15 = v13[3];
  if (vabdd_f64(v15, v14) >= 15.0)
  {
    if (v15 >= v14) {
      id v17 = v6;
    }
    else {
      id v17 = v5;
    }
    id v16 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v17];
  }
  else
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_3;
    v37[3] = &unk_2641035F0;
    id v38 = v6;
    id v16 = v7;
    id v39 = v16;
    [v5 enumerateKeysAndObjectsUsingBlock:v37];

    double v7 = v38;
  }

  v18 = [v16 allKeys];
  v19 = [v18 sortedArrayUsingComparator:&__block_literal_global_172];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_5;
  v33[3] = &unk_264103660;
  id v20 = v19;
  id v34 = v20;
  id v21 = v10;
  id v35 = v21;
  id v22 = v16;
  id v36 = v22;
  [v21 enumerateKeysAndObjectsUsingBlock:v33];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_7;
  v29[3] = &unk_264103660;
  id v23 = v20;
  id v30 = v23;
  id v24 = v21;
  id v31 = v24;
  id v25 = v22;
  id v32 = v25;
  [v24 enumerateKeysAndObjectsUsingBlock:v29];
  v26 = v32;
  id v27 = v24;

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v27;
}

uint64_t __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:&unk_26C1E9F08 forKey:a2];
}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  id v6 = +[PAAudiogramUtilities ptaFrequencies];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {
    [v9 doubleValue];
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8
                                                                + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  }
}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  id v6 = +[PAAudiogramUtilities ptaFrequencies];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {
    [v9 doubleValue];
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8
                                                                + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  }
}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v14 = [v5 objectForKey:v7];
  double v8 = *(void **)(a1 + 40);
  id v9 = NSNumber;
  [v6 doubleValue];
  double v11 = v10;

  [v14 doubleValue];
  double v13 = [v9 numberWithDouble:v12 * 0.5 + v11 * 0.5];
  [v8 setObject:v13 forKey:v7];
}

uint64_t __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] indexOfObject:v3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = a1[4];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_6;
    v7[3] = &unk_264103638;
    id v8 = v3;
    id v9 = a1[4];
    id v10 = a1[6];
    id v11 = a1[5];
    [v4 enumerateObjectsUsingBlock:v7];
  }
  else
  {
    id v5 = a1[5];
    id v6 = [a1[6] objectForKey:v3];
    [v5 setObject:v6 forKey:v3];
  }
}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v25 = a2;
  uint64_t v7 = [v25 compare:*(void *)(a1 + 32)];
  if (a3 && v7 == 1)
  {
    id v8 = [*(id *)(a1 + 40) objectAtIndex:a3 - 1];
    id v9 = [*(id *)(a1 + 48) objectForKey:v25];
    [v9 floatValue];
    float v11 = v10;

    double v12 = [*(id *)(a1 + 48) objectForKey:v8];
    [v12 floatValue];
    float v14 = v13;

    [*(id *)(a1 + 32) floatValue];
    float v16 = v15;
    [v8 floatValue];
    float v18 = v16 - v17;
    [v25 floatValue];
    float v20 = v19;
    [v8 floatValue];
    *(float *)&double v22 = (float)(v14 * (float)(1.0 - (float)(v18 / (float)(v20 - v21))))
                   + (float)((float)(v18 / (float)(v20 - v21)) * v11);
    id v23 = *(void **)(a1 + 56);
    id v24 = [NSNumber numberWithFloat:v22];
    [v23 setObject:v24 forKey:*(void *)(a1 + 32)];

    *a4 = 1;
  }
}

void __73__PAAudiogramUtilities_normalizedOffsetsFromLeftOffsets_andRightOffsets___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  [a3 doubleValue];
  if (v5 == 0.0)
  {
    id v6 = [*(id *)(a1 + 32) firstObject];
    uint64_t v7 = [v13 compare:v6];

    id v8 = *(void **)(a1 + 40);
    id v9 = *(void **)(a1 + 48);
    float v10 = *(void **)(a1 + 32);
    if (v7 == 1) {
      [v10 lastObject];
    }
    else {
    float v11 = [v10 firstObject];
    }
    double v12 = [v9 objectForKey:v11];
    [v8 setObject:v12 forKey:v13];
  }
}

+ (id)offsetsSortedByFrequency:(id)a3
{
  id v3 = a3;
  id v4 = [v3 allKeys];
  double v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_174];

  id v6 = [v3 objectsForKeys:v5 notFoundMarker:&unk_26C1E9F08];

  return v6;
}

uint64_t __49__PAAudiogramUtilities_offsetsSortedByFrequency___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)frequencyDictionaryFromOffsets:(id)a3
{
  id v3 = a3;
  id v4 = +[PAAudiogramUtilities presetFrequencies];
  double v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = [v4 count];
  if (v6 == [v3 count])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__PAAudiogramUtilities_frequencyDictionaryFromOffsets___block_invoke;
    v8[3] = &unk_264103688;
    id v9 = v5;
    id v10 = v4;
    [v3 enumerateObjectsUsingBlock:v8];
  }
  return v5;
}

void __55__PAAudiogramUtilities_frequencyDictionaryFromOffsets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  double v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  [v4 setObject:v6 forKey:v7];
}

@end