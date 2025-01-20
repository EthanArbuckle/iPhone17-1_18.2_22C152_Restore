@interface URLEncoding
+ (id)bitStringFromURL:(id)a3 encodingOption:(id)a4 urlEncodingParameters:(id)a5 encodingClient:(id)a6 error:(id *)a7;
@end

@implementation URLEncoding

+ (id)bitStringFromURL:(id)a3 encodingOption:(id)a4 urlEncodingParameters:(id)a5 encodingClient:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = [v13 objectForKeyedSubscript:@"pathElementsBits"];
  id v16 = [v15 intValue];

  v17 = [v13 objectForKeyedSubscript:@"hostNameBits"];
  signed int v18 = [v17 intValue];

  v19 = [v13 objectForKeyedSubscript:@"pathLengthBits"];

  id v20 = [v19 intValue];
  v21 = +[NSURL URLWithString:v14];

  v22 = [v21 host];
  v23 = [v21 path];
  v24 = v23;
  if (v22 && v23)
  {
    v50 = a7;
    v51 = v12;
    if ((unint64_t)[v23 length] < 2)
    {
      uint64_t v33 = 0;
      v34 = &stru_100031ED0;
    }
    else
    {
      v25 = [v24 componentsSeparatedByString:@"/"];
      id v26 = v20;
      id v27 = v16;
      signed int v28 = v18;
      v29 = v21;
      v30 = v22;
      id v31 = v11;
      unsigned int v32 = [v25 count];
      uint64_t v33 = v32 - [v24 hasPrefix:@"/"];
      id v11 = v31;
      v22 = v30;
      v21 = v29;
      signed int v18 = v28;
      id v16 = v27;
      id v20 = v26;

      v34 = +[FedStatsUtil sha1:v24];
    }
    v36 = +[FedStatsUtil intToBitString:v33 length:v16];
    uint64_t v37 = +[FedStatsUtil intToBitString:length:](FedStatsUtil, "intToBitString:length:", [v24 length], v20);
    v38 = +[FedStatsUtil sha1:v22];
    v39 = [v38 substringToIndex:v18];

    if ([v11 isEqualToString:@"url_hash_hash"])
    {
      v40 = (__CFString *)v37;
      v35 = +[NSString stringWithFormat:@"%@%@", v39, v34];
      id v12 = v51;
LABEL_29:

      goto LABEL_30;
    }
    id v12 = v51;
    if ([v11 isEqualToString:@"url_hash_elements_hash"])
    {
      v40 = (__CFString *)v37;
      +[NSString stringWithFormat:@"%@%@%@", v39, v36, v34];
      v35 = LABEL_15:;
      goto LABEL_29;
    }
    if ([v11 isEqualToString:@"url_hash_elements_length"])
    {
      v40 = (__CFString *)v37;
      +[NSString stringWithFormat:@"%@%@%@", v39, v36, v37];
      goto LABEL_15;
    }
    v40 = (__CFString *)v37;
    v35 = v50;
    v41 = [v51 huffmanCode:v22 error:v50];
    if (!v41)
    {
      if (v50)
      {
        +[NSString stringWithFormat:@"Host %@ is not in the Huffman database.", v22];
        v42 = id v47 = v11;
        id *v50 = +[_DPMLRuntimeError errorWithCode:300 description:v42];

        id v11 = v47;
        v41 = 0;
        id v12 = v51;
        v35 = 0;
      }
      goto LABEL_28;
    }
    id v49 = v41;
    if ([v11 isEqualToString:@"url_huffman_hash"])
    {
      +[NSString stringWithFormat:@"%@%@", v49, v34, v45];
    }
    else
    {
      if ([v11 isEqualToString:@"url_huffman_emements_hash"])
      {
        v46 = v34;
      }
      else
      {
        if (![v11 isEqualToString:@"url_huffman_emements_length"])
        {
          v35 = v50;
          if (v50)
          {
            +[NSString stringWithFormat:@"Unknown URL encoding option: %@.", v11];
            v44 = id v48 = v11;
            id *v50 = +[_DPMLRuntimeError errorWithCode:300 description:v44];

            id v11 = v48;
            id v12 = v51;
            v35 = 0;
          }
          goto LABEL_27;
        }
        v46 = v40;
      }
      +[NSString stringWithFormat:@"%@%@%@", v49, v36, v46];
    v35 = };
LABEL_27:
    v41 = v49;
LABEL_28:

    goto LABEL_29;
  }
  if (a7)
  {
    +[_DPMLRuntimeError errorWithCode:300 description:@"Host or path of URL is nil: %@."];
    v35 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
LABEL_30:

  return v35;
}

@end