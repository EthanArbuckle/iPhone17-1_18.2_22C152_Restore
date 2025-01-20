@interface MRContentItem
+ (id)extractedIdentifierFromNowPlayingInfo:(id)a3;
+ (id)mergeContentItems:(id)a3;
- (BOOL)isEffectivelyEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MRArtwork)artwork;
- (MRContentItem)initWithData:(id)a3;
- (MRContentItem)initWithIdentifier:(id)a3;
- (MRContentItem)initWithNowPlayingInfo:(id)a3;
- (MRContentItem)initWithProtobuf:(id)a3;
- (MRContentItem)skeleton;
- (MRContentItemMetadata)metadata;
- (NSArray)availableArtworkFormats;
- (NSArray)availableLanguageOptions;
- (NSArray)availableRemoteArtworkFormats;
- (NSArray)currentLanguageOptions;
- (NSArray)sections;
- (NSArray)transcriptAlignments;
- (NSData)data;
- (NSDictionary)artworks;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)nowPlayingInfo;
- (NSDictionary)remoteArtworks;
- (NSString)ancestorIdentifier;
- (NSString)associatedParticipantIdentifier;
- (NSString)identifier;
- (NSString)info;
- (NSString)parentIdentifier;
- (NSString)queueIdentifier;
- (NSString)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protobufWithEncoding:(int64_t)a3;
- (void)mergeFrom:(id)a3;
- (void)setAncestorIdentifier:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworks:(id)a3;
- (void)setAssociatedParticipantIdentifier:(id)a3;
- (void)setAvailableArtworkFormats:(id)a3;
- (void)setAvailableLanguageOptions:(id)a3;
- (void)setAvailableRemoteArtworkFormats:(id)a3;
- (void)setCurrentLanguageOptions:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInfo:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNowPlayingInfo:(id)a3 policy:(unsigned __int8)a4 request:(id)a5;
- (void)setParentIdentifier:(id)a3;
- (void)setQueueIdentifier:(id)a3;
- (void)setRemoteArtworks:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setSections:(id)a3;
- (void)setTranscriptAlignments:(id)a3;
@end

@implementation MRContentItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteArtworks, 0);
  objc_storeStrong((id *)&self->_artworks, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_availableRemoteArtworkFormats, 0);
  objc_storeStrong((id *)&self->_availableArtworkFormats, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_ancestorIdentifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_currentLanguageOptions, 0);
  objc_storeStrong((id *)&self->_availableLanguageOptions, 0);
  objc_storeStrong((id *)&self->_transcriptAlignments, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(MRContentItem *)self identifier];
  [v3 setObject:v4 forKeyedSubscript:@"identifier"];

  v5 = [(MRContentItem *)self info];
  [v3 setObject:v5 forKeyedSubscript:@"info"];

  v6 = [(MRContentItem *)self parentIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"parentIdentifier"];

  v7 = [(MRContentItem *)self ancestorIdentifier];
  [v3 setObject:v7 forKeyedSubscript:@"ancestorIdentifier"];

  v8 = [(MRContentItem *)self associatedParticipantIdentifier];
  [v3 setObject:v8 forKeyedSubscript:@"associatedParticipantIdentifier"];

  v9 = [(MRContentItem *)self queueIdentifier];
  [v3 setObject:v9 forKeyedSubscript:@"queueIdentifier"];

  v10 = [(MRContentItem *)self requestIdentifier];
  [v3 setObject:v10 forKeyedSubscript:@"requestIdentifier"];

  v11 = [(MRContentItem *)self metadata];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"metadata"];

  v13 = [(MRContentItem *)self artwork];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"artwork"];

  v15 = [(MRContentItem *)self transcriptAlignments];
  v16 = objc_msgSend(v15, "mr_map:", &__block_literal_global_64);
  [v3 setObject:v16 forKeyedSubscript:@"transcriptAlignments"];

  v17 = [(MRContentItem *)self availableLanguageOptions];
  v18 = objc_msgSend(v17, "mr_map:", &__block_literal_global_69_0);
  [v3 setObject:v18 forKeyedSubscript:@"availableLanguageOptions"];

  v19 = [(MRContentItem *)self currentLanguageOptions];
  v20 = objc_msgSend(v19, "mr_map:", &__block_literal_global_74_0);
  [v3 setObject:v20 forKeyedSubscript:@"currentLanguageOptions"];

  v21 = [(MRContentItem *)self sections];
  v22 = objc_msgSend(v21, "mr_map:", &__block_literal_global_79_0);
  [v3 setObject:v22 forKeyedSubscript:@"sections"];

  v23 = [(MRContentItem *)self availableArtworkFormats];
  [v3 setObject:v23 forKeyedSubscript:@"availableArtworkFormats"];

  v24 = [(MRContentItem *)self availableRemoteArtworkFormats];
  [v3 setObject:v24 forKeyedSubscript:@"availableRemoteArtworkFormats"];

  v25 = [(MRContentItem *)self artworks];
  [v3 setObject:v25 forKeyedSubscript:@"artworks"];

  v26 = [(MRContentItem *)self remoteArtworks];
  [v3 setObject:v26 forKeyedSubscript:@"remoteArtworks"];

  return (NSDictionary *)v3;
}

- (id)protobufWithEncoding:(int64_t)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v5 = objc_alloc_init(_MRContentItemProtobuf);
  v6 = [(MRContentItem *)self artwork];
  -[_MRContentItemProtobuf setArtworkDataWidth:](v5, "setArtworkDataWidth:", [v6 width]);

  v7 = [(MRContentItem *)self artwork];
  -[_MRContentItemProtobuf setHasArtworkDataWidth:](v5, "setHasArtworkDataWidth:", [v7 width] > 0);

  v8 = [(MRContentItem *)self artwork];
  -[_MRContentItemProtobuf setArtworkDataHeight:](v5, "setArtworkDataHeight:", [v8 height]);

  v9 = [(MRContentItem *)self artwork];
  -[_MRContentItemProtobuf setHasArtworkDataHeight:](v5, "setHasArtworkDataHeight:", [v9 height] > 0);

  v10 = [(MRContentItem *)self identifier];
  [(_MRContentItemProtobuf *)v5 setIdentifier:v10];

  v11 = [(MRContentItem *)self artwork];
  v12 = [v11 imageData];
  [(_MRContentItemProtobuf *)v5 setArtworkData:v12];

  v13 = [(MRContentItem *)self info];
  [(_MRContentItemProtobuf *)v5 setInfo:v13];

  v14 = [(MRContentItem *)self parentIdentifier];
  [(_MRContentItemProtobuf *)v5 setParentIdentifier:v14];

  v15 = [(MRContentItem *)self ancestorIdentifier];
  [(_MRContentItemProtobuf *)v5 setAncestorIdentifier:v15];

  v16 = [(MRContentItem *)self associatedParticipantIdentifier];
  [(_MRContentItemProtobuf *)v5 setAssociatedParticipantIdentifier:v16];

  v17 = [(MRContentItem *)self queueIdentifier];
  [(_MRContentItemProtobuf *)v5 setQueueIdentifier:v17];

  v18 = [(MRContentItem *)self requestIdentifier];
  [(_MRContentItemProtobuf *)v5 setRequestIdentifier:v18];

  v19 = [(MRContentItem *)self metadata];
  v20 = [v19 protobufWithEncoding:a3];
  [(_MRContentItemProtobuf *)v5 setMetadata:v20];

  v21 = [(MRContentItem *)self transcriptAlignments];
  v22 = objc_msgSend(v21, "mr_map:", &__block_literal_global_26_0);
  v23 = (void *)[v22 mutableCopy];
  [(_MRContentItemProtobuf *)v5 setTranscriptAlignments:v23];

  v24 = [(MRContentItem *)self availableLanguageOptions];
  v25 = objc_msgSend(v24, "mr_map:", &__block_literal_global_29_0);
  v26 = (void *)[v25 mutableCopy];
  [(_MRContentItemProtobuf *)v5 setAvailableLanguageOptions:v26];

  v27 = [(MRContentItem *)self currentLanguageOptions];
  v28 = objc_msgSend(v27, "mr_map:", &__block_literal_global_32_1);
  v29 = (void *)[v28 mutableCopy];
  [(_MRContentItemProtobuf *)v5 setCurrentLanguageOptions:v29];

  v30 = [(MRContentItem *)self sections];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __38__MRContentItem_protobufWithEncoding___block_invoke_4;
  v71[3] = &__block_descriptor_40_e23__16__0__MRContentItem_8l;
  v71[4] = a3;
  v31 = objc_msgSend(v30, "mr_map:", v71);
  v32 = (void *)[v31 mutableCopy];
  [(_MRContentItemProtobuf *)v5 setSections:v32];

  v33 = [(MRContentItem *)self availableArtworkFormats];
  v34 = (void *)[v33 mutableCopy];
  [(_MRContentItemProtobuf *)v5 setAvailableArtworkFormats:v34];

  v35 = [(MRContentItem *)self availableRemoteArtworkFormats];
  v36 = (void *)[v35 mutableCopy];
  v62 = v5;
  [(_MRContentItemProtobuf *)v5 setAvailableRemoteArtworkFormats:v36];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v61 = self;
  v37 = [(MRContentItem *)self artworks];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v68 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        v43 = objc_alloc_init(_MRDataArtworkProtobuf);
        [(_MRDataArtworkProtobuf *)v43 setType:v42];
        v44 = [(MRContentItem *)v61 artworks];
        v45 = [v44 objectForKeyedSubscript:v42];
        v46 = [v45 imageData];
        [(_MRDataArtworkProtobuf *)v43 setImageData:v46];

        [(_MRContentItemProtobuf *)v62 addDataArtworks:v43];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v39);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = [(MRContentItem *)v61 remoteArtworks];
  uint64_t v47 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v64 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = *(void *)(*((void *)&v63 + 1) + 8 * j);
        v52 = objc_alloc_init(_MRRemoteArtworkProtobuf);
        [(_MRRemoteArtworkProtobuf *)v52 setType:v51];
        v53 = [(MRContentItem *)v61 remoteArtworks];
        v54 = [v53 objectForKeyedSubscript:v51];
        v55 = [v54 artworkURLString];
        [(_MRRemoteArtworkProtobuf *)v52 setArtworkURLString:v55];

        v56 = [(MRContentItem *)v61 remoteArtworks];
        v57 = [v56 objectForKeyedSubscript:v51];
        v58 = [v57 artworkURLTemplateData];
        [(_MRRemoteArtworkProtobuf *)v52 setArtworkURLTemplateData:v58];

        [(_MRContentItemProtobuf *)v62 addRemoteArtworks:v52];
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v48);
  }

  return v62;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 identifier];

  if (v5)
  {
    v6 = [v4 identifier];
    [(MRContentItem *)self setIdentifier:v6];
  }
  v7 = [(MRContentItem *)self metadata];

  v8 = [v4 metadata];
  v9 = v8;
  if (v7)
  {

    if (!v9) {
      goto LABEL_8;
    }
    v9 = [(MRContentItem *)self metadata];
    v10 = [v4 metadata];
    [v9 mergeFrom:v10];
  }
  else
  {
    [(MRContentItem *)self setMetadata:v8];
  }

LABEL_8:
  v11 = [v4 info];

  if (v11)
  {
    v12 = [v4 info];
    [(MRContentItem *)self setInfo:v12];
  }
  v13 = [v4 transcriptAlignments];

  if (v13)
  {
    v14 = [v4 transcriptAlignments];
    [(MRContentItem *)self setTranscriptAlignments:v14];
  }
  v15 = [v4 parentIdentifier];

  if (v15)
  {
    v16 = [v4 parentIdentifier];
    [(MRContentItem *)self setParentIdentifier:v16];
  }
  v17 = [v4 ancestorIdentifier];

  if (v17)
  {
    v18 = [v4 ancestorIdentifier];
    [(MRContentItem *)self setAncestorIdentifier:v18];
  }
  v19 = [v4 associatedParticipantIdentifier];

  if (v19)
  {
    v20 = [v4 associatedParticipantIdentifier];
    [(MRContentItem *)self setAssociatedParticipantIdentifier:v20];
  }
  v21 = [v4 queueIdentifier];

  if (v21)
  {
    v22 = [v4 queueIdentifier];
    [(MRContentItem *)self setQueueIdentifier:v22];
  }
  v23 = [v4 requestIdentifier];

  if (v23)
  {
    v24 = [v4 requestIdentifier];
    [(MRContentItem *)self setRequestIdentifier:v24];
  }
  v25 = [v4 artwork];

  if (v25)
  {
    v26 = [v4 artwork];
    [(MRContentItem *)self setArtwork:v26];
  }
  v27 = [v4 availableLanguageOptions];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    v29 = [v4 availableLanguageOptions];
    [(MRContentItem *)self setAvailableLanguageOptions:v29];
  }
  v30 = [v4 currentLanguageOptions];
  uint64_t v31 = [v30 count];

  if (v31)
  {
    v32 = [v4 currentLanguageOptions];
    [(MRContentItem *)self setCurrentLanguageOptions:v32];
  }
  v33 = [v4 sections];
  uint64_t v34 = [v33 count];

  if (v34)
  {
    v35 = [v4 sections];
    [(MRContentItem *)self setSections:v35];
  }
  v36 = [v4 availableArtworkFormats];

  if (v36)
  {
    v37 = [v4 availableArtworkFormats];
    [(MRContentItem *)self setAvailableArtworkFormats:v37];
  }
  uint64_t v38 = [v4 availableRemoteArtworkFormats];

  if (v38)
  {
    uint64_t v39 = [v4 availableRemoteArtworkFormats];
    [(MRContentItem *)self setAvailableRemoteArtworkFormats:v39];
  }
  uint64_t v40 = [v4 artworks];
  uint64_t v41 = [v40 count];

  if (v41)
  {
    uint64_t v42 = [(MRContentItem *)self artworks];

    if (v42)
    {
      v43 = [(MRContentItem *)self artworks];
      v44 = (void *)[v43 mutableCopy];

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v45 = [v4 artworks];
      v46 = [v45 allKeys];

      uint64_t v47 = [v46 countByEnumeratingWithState:&v74 objects:v79 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v75 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v51 = *(void *)(*((void *)&v74 + 1) + 8 * i);
            v52 = [v4 artworks];
            v53 = [v52 objectForKeyedSubscript:v51];
            [v44 setObject:v53 forKeyedSubscript:v51];
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v74 objects:v79 count:16];
        }
        while (v48);
      }

      v54 = (void *)[v44 copy];
      [(MRContentItem *)self setArtworks:v54];
    }
    else
    {
      v44 = [v4 artworks];
      [(MRContentItem *)self setArtworks:v44];
    }
  }
  v55 = [v4 remoteArtworks];
  uint64_t v56 = [v55 count];

  if (v56)
  {
    v57 = [(MRContentItem *)self remoteArtworks];

    if (v57)
    {
      v58 = [(MRContentItem *)self remoteArtworks];
      v59 = (void *)[v58 mutableCopy];

      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v60 = objc_msgSend(v4, "remoteArtworks", 0);
      v61 = [v60 allKeys];

      uint64_t v62 = [v61 countByEnumeratingWithState:&v70 objects:v78 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v71;
        do
        {
          for (uint64_t j = 0; j != v63; ++j)
          {
            if (*(void *)v71 != v64) {
              objc_enumerationMutation(v61);
            }
            uint64_t v66 = *(void *)(*((void *)&v70 + 1) + 8 * j);
            long long v67 = [v4 remoteArtworks];
            long long v68 = [v67 objectForKeyedSubscript:v66];
            [v59 setObject:v68 forKeyedSubscript:v66];
          }
          uint64_t v63 = [v61 countByEnumeratingWithState:&v70 objects:v78 count:16];
        }
        while (v63);
      }

      long long v69 = (void *)[v59 copy];
      [(MRContentItem *)self setRemoteArtworks:v69];
    }
    else
    {
      v59 = [v4 remoteArtworks];
      [(MRContentItem *)self setRemoteArtworks:v59];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(MRContentItem *)self identifier];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setIdentifier:v7];

  v8 = [(MRContentItem *)self metadata];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setMetadata:v9];

  v10 = [(MRContentItem *)self info];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setInfo:v11];

  v12 = [(MRContentItem *)self parentIdentifier];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setParentIdentifier:v13];

  v14 = [(MRContentItem *)self ancestorIdentifier];
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setAncestorIdentifier:v15];

  v16 = [(MRContentItem *)self associatedParticipantIdentifier];
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setAssociatedParticipantIdentifier:v17];

  v18 = [(MRContentItem *)self queueIdentifier];
  v19 = (void *)[v18 copyWithZone:a3];
  [v5 setQueueIdentifier:v19];

  v20 = [(MRContentItem *)self requestIdentifier];
  v21 = (void *)[v20 copyWithZone:a3];
  [v5 setRequestIdentifier:v21];

  v22 = [(MRContentItem *)self artwork];
  v23 = (void *)[v22 copyWithZone:a3];
  [v5 setArtwork:v23];

  v24 = [(MRContentItem *)self transcriptAlignments];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __30__MRContentItem_copyWithZone___block_invoke;
  v44[3] = &__block_descriptor_40_e31__16__0__MRTranscriptAlignment_8l;
  v44[4] = a3;
  v25 = objc_msgSend(v24, "mr_map:", v44);
  [v5 setTranscriptAlignments:v25];

  v26 = [(MRContentItem *)self availableLanguageOptions];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __30__MRContentItem_copyWithZone___block_invoke_2;
  v43[3] = &__block_descriptor_40_e31__16__0__MRLanguageOptionGroup_8l;
  v43[4] = a3;
  v27 = objc_msgSend(v26, "mr_map:", v43);
  [v5 setAvailableLanguageOptions:v27];

  uint64_t v28 = [(MRContentItem *)self currentLanguageOptions];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __30__MRContentItem_copyWithZone___block_invoke_3;
  v42[3] = &__block_descriptor_40_e26__16__0__MRLanguageOption_8l;
  v42[4] = a3;
  v29 = objc_msgSend(v28, "mr_map:", v42);
  [v5 setCurrentLanguageOptions:v29];

  v30 = [(MRContentItem *)self sections];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __30__MRContentItem_copyWithZone___block_invoke_4;
  v41[3] = &__block_descriptor_40_e23__16__0__MRContentItem_8l;
  v41[4] = a3;
  uint64_t v31 = objc_msgSend(v30, "mr_map:", v41);
  [v5 setSections:v31];

  v32 = [(MRContentItem *)self availableArtworkFormats];
  v33 = (void *)[v32 copyWithZone:a3];
  [v5 setAvailableArtworkFormats:v33];

  uint64_t v34 = [(MRContentItem *)self availableRemoteArtworkFormats];
  v35 = (void *)[v34 copyWithZone:a3];
  [v5 setAvailableRemoteArtworkFormats:v35];

  v36 = [(MRContentItem *)self artworks];
  v37 = (void *)[v36 copyWithZone:a3];
  [v5 setArtworks:v37];

  uint64_t v38 = [(MRContentItem *)self remoteArtworks];
  uint64_t v39 = (void *)[v38 copyWithZone:a3];
  [v5 setRemoteArtworks:v39];

  return v5;
}

- (MRArtwork)artwork
{
  return self->_artwork;
}

- (NSArray)currentLanguageOptions
{
  return self->_currentLanguageOptions;
}

- (NSArray)availableLanguageOptions
{
  return self->_availableLanguageOptions;
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSString)associatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (NSString)ancestorIdentifier
{
  return self->_ancestorIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSDictionary)artworks
{
  return self->_artworks;
}

- (NSArray)transcriptAlignments
{
  return self->_transcriptAlignments;
}

- (NSDictionary)remoteArtworks
{
  return self->_remoteArtworks;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSString)info
{
  return self->_info;
}

- (NSArray)availableRemoteArtworkFormats
{
  return self->_availableRemoteArtworkFormats;
}

- (NSArray)availableArtworkFormats
{
  return self->_availableArtworkFormats;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setArtwork:(id)a3
{
}

- (void)setSections:(id)a3
{
}

- (void)setRemoteArtworks:(id)a3
{
}

- (void)setInfo:(id)a3
{
}

- (void)setArtworks:(id)a3
{
}

- (void)setParentIdentifier:(id)a3
{
}

- (void)setCurrentLanguageOptions:(id)a3
{
}

- (void)setAvailableLanguageOptions:(id)a3
{
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
}

- (void)setAncestorIdentifier:(id)a3
{
}

- (void)setTranscriptAlignments:(id)a3
{
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void)setQueueIdentifier:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setAvailableRemoteArtworkFormats:(id)a3
{
}

- (void)setAvailableArtworkFormats:(id)a3
{
}

- (NSDictionary)nowPlayingInfo
{
  v304[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(MRContentItem *)self metadata];
  id v4 = [v3 nowPlayingInfo];
  id v5 = (id)[v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v6 = [(MRContentItem *)self identifier];

  if (v6)
  {
    v7 = [(MRContentItem *)self identifier];
    [v5 setObject:v7 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoContentItemIdentifier"];
  }
  v8 = [(MRContentItem *)self metadata];
  v9 = [v8 albumName];

  if (v9)
  {
    v10 = [(MRContentItem *)self metadata];
    v11 = [v10 albumName];
    [v5 setObject:v11 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAlbum"];
  }
  v12 = [(MRContentItem *)self metadata];
  v13 = [v12 trackArtistName];

  if (v13)
  {
    v14 = [(MRContentItem *)self metadata];
    v15 = [v14 trackArtistName];
    [v5 setObject:v15 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtist"];
  }
  v16 = [(MRContentItem *)self metadata];
  v17 = [v16 assetURL];

  if (v17)
  {
    v18 = [(MRContentItem *)self metadata];
    v19 = [v18 assetURL];
    [v5 setObject:v19 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAssetURL"];
  }
  v20 = [(MRContentItem *)self metadata];
  v21 = [v20 composer];

  if (v21)
  {
    v22 = [(MRContentItem *)self metadata];
    v23 = [v22 composer];
    [v5 setObject:v23 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoComposer"];
  }
  v24 = [(MRContentItem *)self metadata];
  int v25 = [v24 hasDiscNumber];

  if (v25)
  {
    v26 = NSNumber;
    v27 = [(MRContentItem *)self metadata];
    uint64_t v28 = objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "discNumber"));
    [v5 setObject:v28 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDiscNumber"];
  }
  v29 = [(MRContentItem *)self metadata];
  v30 = [v29 genre];

  if (v30)
  {
    uint64_t v31 = [(MRContentItem *)self metadata];
    v32 = [v31 genre];
    [v5 setObject:v32 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoGenre"];
  }
  v33 = [(MRContentItem *)self metadata];
  int v34 = [v33 hasPlaybackRate];

  if (v34)
  {
    v35 = NSNumber;
    v36 = [(MRContentItem *)self metadata];
    [v36 playbackRate];
    v37 = objc_msgSend(v35, "numberWithFloat:");
    [v5 setObject:v37 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoPlaybackRate"];
  }
  uint64_t v38 = [(MRContentItem *)self metadata];
  uint64_t v39 = [v38 currentPlaybackDate];

  if (v39)
  {
    uint64_t v40 = [(MRContentItem *)self metadata];
    uint64_t v41 = [v40 currentPlaybackDate];
    [v5 setObject:v41 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoCurrentPlaybackDate"];
  }
  uint64_t v42 = [(MRContentItem *)self metadata];
  int v43 = [v42 hasAlwaysLive];

  if (v43)
  {
    v44 = NSNumber;
    v45 = [(MRContentItem *)self metadata];
    v46 = objc_msgSend(v44, "numberWithBool:", objc_msgSend(v45, "isAlwaysLive"));
    [v5 setObject:v46 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsAlwaysLive"];
  }
  uint64_t v47 = [(MRContentItem *)self metadata];
  char v48 = [v47 isAlwaysLive];

  if ((v48 & 1) == 0)
  {
    uint64_t v49 = [(MRContentItem *)self metadata];
    int v50 = [v49 hasDuration];

    if (v50)
    {
      uint64_t v51 = NSNumber;
      v52 = [(MRContentItem *)self metadata];
      [v52 duration];
      v53 = objc_msgSend(v51, "numberWithDouble:");
      [v5 setObject:v53 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDuration"];
    }
    v54 = [(MRContentItem *)self metadata];
    int v55 = [v54 hasElapsedTime];

    if (v55)
    {
      uint64_t v56 = NSNumber;
      v57 = [(MRContentItem *)self metadata];
      [v57 elapsedTime];
      v58 = objc_msgSend(v56, "numberWithDouble:");
      [v5 setObject:v58 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoElapsedTime"];
    }
  }
  v59 = [(MRContentItem *)self metadata];
  int v60 = [v59 hasInTransition];

  if (v60)
  {
    v61 = NSNumber;
    uint64_t v62 = [(MRContentItem *)self metadata];
    uint64_t v63 = objc_msgSend(v61, "numberWithBool:", objc_msgSend(v62, "isInTransition"));
    [v5 setObject:v63 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsInTransition"];
  }
  uint64_t v64 = [(MRContentItem *)self metadata];
  int v65 = [v64 hasInferredTimestamp];

  if (v65)
  {
    uint64_t v66 = NSNumber;
    long long v67 = [(MRContentItem *)self metadata];
    [v67 inferredTimestamp];
    long long v68 = objc_msgSend(v66, "numberWithDouble:");
    [v5 setObject:v68 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTimestamp"];
  }
  long long v69 = [(MRContentItem *)self metadata];
  char v70 = [v69 hasElapsedTimeTimestamp];

  if (v70)
  {
    long long v71 = NSNumber;
    long long v72 = [(MRContentItem *)self metadata];
    [v72 elapsedTimeTimestamp];
    long long v73 = objc_msgSend(v71, "numberWithDouble:");
    [v5 setObject:v73 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTimestamp"];
  }
  long long v74 = [v5 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTimestamp"];
  long long v75 = v74;
  if (v74)
  {
    long long v76 = (void *)MEMORY[0x1E4F1C9C8];
    [v74 doubleValue];
    long long v77 = objc_msgSend(v76, "dateWithTimeIntervalSinceReferenceDate:");
    [v5 setObject:v77 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTimestamp"];
  }
  v78 = [(MRContentItem *)self metadata];
  int v79 = [v78 hasStartTime];

  if (v79)
  {
    uint64_t v80 = (void *)MEMORY[0x1E4F1C9C8];
    v81 = [(MRContentItem *)self metadata];
    [v81 startTime];
    v82 = objc_msgSend(v80, "dateWithTimeIntervalSinceReferenceDate:");

    [v5 setObject:v82 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoStartTime"];
  }
  v83 = [(MRContentItem *)self metadata];
  v84 = [v83 title];

  if (v84)
  {
    v85 = [(MRContentItem *)self metadata];
    v86 = [v85 title];
    [v5 setObject:v86 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTitle"];
  }
  v87 = [(MRContentItem *)self metadata];
  int v88 = [v87 hasTotalDiscCount];

  if (v88)
  {
    v89 = NSNumber;
    v90 = [(MRContentItem *)self metadata];
    v91 = objc_msgSend(v89, "numberWithInteger:", objc_msgSend(v90, "totalDiscCount"));
    [v5 setObject:v91 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTotalDiscCount"];
  }
  v92 = [(MRContentItem *)self metadata];
  int v93 = [v92 hasTotalTrackCount];

  if (v93)
  {
    v94 = NSNumber;
    v95 = [(MRContentItem *)self metadata];
    v96 = objc_msgSend(v94, "numberWithInteger:", objc_msgSend(v95, "totalTrackCount"));
    [v5 setObject:v96 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTotalTrackCount"];
  }
  v97 = [(MRContentItem *)self metadata];
  int v98 = [v97 hasTrackNumber];

  if (v98)
  {
    v99 = NSNumber;
    v100 = [(MRContentItem *)self metadata];
    v101 = objc_msgSend(v99, "numberWithInteger:", objc_msgSend(v100, "trackNumber"));
    [v5 setObject:v101 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTrackNumber"];
  }
  v102 = [(MRContentItem *)self metadata];
  v103 = [v102 collectionIdentifier];

  if (v103)
  {
    v104 = [(MRContentItem *)self metadata];
    v105 = [v104 collectionIdentifier];
    [v5 setObject:v105 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoCollectionIdentifier"];
  }
  v106 = [(MRContentItem *)self metadata];
  v107 = [v106 contentIdentifier];

  if (v107)
  {
    v108 = [(MRContentItem *)self metadata];
    v109 = [v108 contentIdentifier];
    [v5 setObject:v109 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoExternalContentIdentifier"];
  }
  v110 = [(MRContentItem *)self metadata];
  v111 = [v110 profileIdentifier];

  if (v111)
  {
    v112 = [(MRContentItem *)self metadata];
    v113 = [v112 profileIdentifier];
    [v5 setObject:v113 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoExternalProfileIdentifier"];
  }
  v114 = [(MRContentItem *)self metadata];
  v115 = [v114 serviceIdentifier];

  if (v115)
  {
    v116 = [(MRContentItem *)self metadata];
    v117 = [v116 serviceIdentifier];
    [v5 setObject:v117 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoServiceIdentifier"];
  }
  v118 = [(MRContentItem *)self metadata];
  v119 = [v118 brandIdentifier];

  if (v119)
  {
    v120 = [(MRContentItem *)self metadata];
    v121 = [v120 brandIdentifier];
    [v5 setObject:v121 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoBrandIdentifier"];
  }
  v122 = [(MRContentItem *)self metadata];
  int v123 = [v122 hasPlaybackProgress];

  if (v123)
  {
    v124 = NSNumber;
    v125 = [(MRContentItem *)self metadata];
    [v125 playbackProgress];
    v126 = objc_msgSend(v124, "numberWithFloat:");
    [v5 setObject:v126 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoPlaybackProgress"];
  }
  v127 = [(MRContentItem *)self metadata];
  int v128 = [v127 hasExplicitItem];

  if (v128)
  {
    v129 = NSNumber;
    v130 = [(MRContentItem *)self metadata];
    v131 = objc_msgSend(v129, "numberWithBool:", objc_msgSend(v130, "isExplicitItem"));
    [v5 setObject:v131 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsExplicitTrack"];
  }
  v132 = [(MRContentItem *)self metadata];
  int v133 = [v132 hasSharable];

  if (v133)
  {
    v134 = NSNumber;
    v135 = [(MRContentItem *)self metadata];
    v136 = objc_msgSend(v134, "numberWithBool:", objc_msgSend(v135, "isSharable"));
    [v5 setObject:v136 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsSharable"];
  }
  v137 = [(MRContentItem *)self metadata];
  int v138 = [v137 hasLiked];

  if (v138)
  {
    v139 = NSNumber;
    v140 = [(MRContentItem *)self metadata];
    v141 = objc_msgSend(v139, "numberWithBool:", objc_msgSend(v140, "isLiked"));
    [v5 setObject:v141 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsLiked"];
  }
  v142 = [(MRContentItem *)self metadata];
  int v143 = [v142 hasInWishList];

  if (v143)
  {
    v144 = NSNumber;
    v145 = [(MRContentItem *)self metadata];
    v146 = objc_msgSend(v144, "numberWithBool:", objc_msgSend(v145, "isInWishList"));
    [v5 setObject:v146 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsInWishList"];
  }
  v147 = [(MRContentItem *)self metadata];
  int v148 = [v147 hasRadioStationIdentifier];

  if (v148)
  {
    v149 = NSNumber;
    v150 = [(MRContentItem *)self metadata];
    v151 = objc_msgSend(v149, "numberWithLongLong:", objc_msgSend(v150, "radioStationIdentifier"));
    [v5 setObject:v151 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoRadioStationIdentifier"];
  }
  v152 = [(MRContentItem *)self metadata];
  v153 = [v152 radioStationName];

  if (v153)
  {
    v154 = [(MRContentItem *)self metadata];
    v155 = [v154 radioStationName];
    [v5 setObject:v155 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoRadioStationName"];
  }
  v156 = [(MRContentItem *)self metadata];
  int v157 = [v156 hasRadioStationIdentifier];

  if (v157)
  {
    v158 = NSNumber;
    v159 = [(MRContentItem *)self metadata];
    v160 = objc_msgSend(v158, "numberWithLongLong:", objc_msgSend(v159, "radioStationIdentifier"));
    [v5 setObject:v160 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoRadioStationStringIdentifier"];
  }
  v161 = [(MRContentItem *)self metadata];
  int v162 = [v161 hasITunesStoreIdentifier];

  if (v162)
  {
    v163 = NSNumber;
    v164 = [(MRContentItem *)self metadata];
    v165 = objc_msgSend(v163, "numberWithLongLong:", objc_msgSend(v164, "iTunesStoreIdentifier"));
    [v5 setObject:v165 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier"];
  }
  v166 = [(MRContentItem *)self metadata];
  int v167 = [v166 hasITunesStoreSubscriptionIdentifier];

  if (v167)
  {
    v168 = NSNumber;
    v169 = [(MRContentItem *)self metadata];
    v170 = objc_msgSend(v168, "numberWithLongLong:", objc_msgSend(v169, "iTunesStoreSubscriptionIdentifier"));
    [v5 setObject:v170 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoiTunesStoreSubscriptionAdamIdentifier"];
  }
  v171 = [(MRContentItem *)self metadata];
  int v172 = [v171 hasITunesStoreArtistIdentifier];

  if (v172)
  {
    v173 = NSNumber;
    v174 = [(MRContentItem *)self metadata];
    v175 = objc_msgSend(v173, "numberWithLongLong:", objc_msgSend(v174, "iTunesStoreArtistIdentifier"));
    [v5 setObject:v175 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtistiTunesStoreAdamIdentifier"];
  }
  v176 = [(MRContentItem *)self metadata];
  int v177 = [v176 hasITunesStoreAlbumIdentifier];

  if (v177)
  {
    v178 = NSNumber;
    v179 = [(MRContentItem *)self metadata];
    v180 = objc_msgSend(v178, "numberWithLongLong:", objc_msgSend(v179, "iTunesStoreAlbumIdentifier"));
    [v5 setObject:v180 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAlbumiTunesStoreAdamIdentifier"];
  }
  v181 = [(MRContentItem *)self metadata];
  v182 = [v181 purchaseInfoData];

  if (v182)
  {
    v183 = [(MRContentItem *)self metadata];
    v184 = [v183 purchaseInfoData];
    [v5 setObject:v184 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoPurchaseInfoData"];
  }
  v185 = [(MRContentItem *)self metadata];
  int v186 = [v185 hasDefaultPlaybackRate];

  if (v186)
  {
    v187 = NSNumber;
    v188 = [(MRContentItem *)self metadata];
    [v188 defaultPlaybackRate];
    v189 = objc_msgSend(v187, "numberWithFloat:");
    [v5 setObject:v189 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate"];
  }
  v190 = [(MRContentItem *)self metadata];
  int v191 = [v190 hasDownloadState];

  if (v191)
  {
    v192 = NSNumber;
    v193 = [(MRContentItem *)self metadata];
    v194 = objc_msgSend(v192, "numberWithInteger:", objc_msgSend(v193, "downloadState"));
    [v5 setObject:v194 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDownloadState"];
  }
  v195 = [(MRContentItem *)self metadata];
  int v196 = [v195 hasDownloadProgress];

  if (v196)
  {
    v197 = NSNumber;
    v198 = [(MRContentItem *)self metadata];
    [v198 downloadProgress];
    v199 = objc_msgSend(v197, "numberWithFloat:");
    [v5 setObject:v199 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDownloadProgress"];
  }
  v200 = [(MRContentItem *)self metadata];
  int v201 = [v200 hasAdvertisement];

  if (v201)
  {
    v202 = NSNumber;
    v203 = [(MRContentItem *)self metadata];
    v204 = objc_msgSend(v202, "numberWithBool:", objc_msgSend(v203, "isAdvertisement"));
    [v5 setObject:v204 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsAdvertisement"];
  }
  v205 = [(MRContentItem *)self metadata];
  int v206 = [v205 hasSteerable];

  if (v206)
  {
    v207 = NSNumber;
    v208 = [(MRContentItem *)self metadata];
    v209 = objc_msgSend(v207, "numberWithBool:", objc_msgSend(v208, "isSteerable"));
    [v5 setObject:v209 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsSteerable"];
  }
  v210 = [(MRContentItem *)self metadata];
  v211 = [v210 artworkIdentifier];

  if (v211)
  {
    v212 = [(MRContentItem *)self metadata];
    v213 = [v212 artworkIdentifier];
    [v5 setObject:v213 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkIdentifier"];
  }
  v214 = [(MRContentItem *)self metadata];
  v215 = [v214 artworkURL];

  if (v215)
  {
    v216 = [(MRContentItem *)self metadata];
    v217 = [v216 artworkURL];
    v218 = [v217 absoluteString];
    [v5 setObject:v218 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkURL"];
  }
  v219 = [(MRContentItem *)self metadata];
  int v220 = [v219 hasLegacyUniqueIdentifier];

  if (v220)
  {
    v221 = NSNumber;
    v222 = [(MRContentItem *)self metadata];
    v223 = objc_msgSend(v221, "numberWithLongLong:", objc_msgSend(v222, "legacyUniqueIdentifier"));
    [v5 setObject:v223 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoUniqueIdentifier"];
  }
  v224 = [(MRContentItem *)self metadata];
  v225 = [v224 appMetrics];

  if (v225)
  {
    v226 = [(MRContentItem *)self metadata];
    v227 = [v226 appMetrics];
    v228 = (void *)[v227 copy];
    [v5 setObject:v228 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAppMetrics"];
  }
  v229 = [(MRContentItem *)self metadata];
  v230 = [v229 collectionInfo];

  if (v230)
  {
    v231 = [(MRContentItem *)self metadata];
    v232 = [v231 collectionInfo];
    v233 = (void *)[v232 copy];
    [v5 setObject:v233 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoCollectionInfo"];
  }
  v234 = [(MRContentItem *)self metadata];
  v235 = [v234 userInfo];

  if (v235)
  {
    v236 = [(MRContentItem *)self metadata];
    v237 = [v236 userInfo];
    v238 = (void *)[v237 copy];
    [v5 setObject:v238 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoUserInfo"];
  }
  v239 = [(MRContentItem *)self metadata];
  v240 = [v239 internationalStandardRecordingCode];

  if (v240)
  {
    v241 = [(MRContentItem *)self metadata];
    v242 = [v241 internationalStandardRecordingCode];
    v243 = (void *)[v242 copy];
    [v5 setObject:v243 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoInternationalStandardRecordingCode"];
  }
  v244 = [(MRContentItem *)self metadata];
  int v245 = [v244 hasExcludeFromSuggestions];

  if (v245)
  {
    v246 = NSNumber;
    v247 = [(MRContentItem *)self metadata];
    v248 = objc_msgSend(v246, "numberWithBool:", objc_msgSend(v247, "excludeFromSuggestions"));
    [v5 setObject:v248 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoExcludeFromSuggestions"];
  }
  v249 = [(MRContentItem *)self metadata];
  v250 = [v249 collectionInfo];

  if (v250)
  {
    id v251 = [v250 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingCollectionInfoKeyIdentifiers"];

    if (v251)
    {
      v298 = v75;
      v304[0] = @"kMRMediaRemoteNowPlayingInfoRadioStationHash";
      v304[1] = @"kMRMediaRemoteNowPlayingInfoRadioStationIdentifier";
      v304[2] = @"kMRMediaRemoteNowPlayingInfoRadioStationStringIdentifier";
      v304[3] = @"kMRMediaRemoteNowPlayingInfoRadioStationName";
      [MEMORY[0x1E4F1C978] arrayWithObjects:v304 count:4];
      long long v299 = 0u;
      long long v300 = 0u;
      long long v301 = 0u;
      long long v302 = 0u;
      id v252 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v253 = [v252 countByEnumeratingWithState:&v299 objects:v303 count:16];
      if (v253)
      {
        uint64_t v254 = v253;
        uint64_t v255 = *(void *)v300;
        do
        {
          for (uint64_t i = 0; i != v254; ++i)
          {
            if (*(void *)v300 != v255) {
              objc_enumerationMutation(v252);
            }
            uint64_t v257 = *(void *)(*((void *)&v299 + 1) + 8 * i);
            v258 = [v251 objectForKeyedSubscript:v257];
            if (v258) {
              [v5 setObject:v258 forKeyedSubscript:v257];
            }
          }
          uint64_t v254 = [v252 countByEnumeratingWithState:&v299 objects:v303 count:16];
        }
        while (v254);
      }

      long long v75 = v298;
    }
  }
  v259 = [(MRContentItem *)self metadata];
  int v260 = [v259 hasMediaType];

  if (v260)
  {
    v261 = [(MRContentItem *)self metadata];
    uint64_t v262 = [v261 mediaType];

    v263 = [(MRContentItem *)self metadata];
    uint64_t v264 = [v263 mediaSubType];

    if (v262 == 1)
    {
      v265 = kMRMediaRemoteNowPlayingInfoTypeAudio;
    }
    else
    {
      if (v262 != 2)
      {
        v266 = 0;
        goto LABEL_127;
      }
      v265 = kMRMediaRemoteNowPlayingInfoTypeVideo;
    }
    v266 = *v265;
LABEL_127:
    v267 = [(MRContentItem *)self metadata];
    int v268 = [v267 hasMediaSubType];

    if (v268)
    {
      switch(v264)
      {
        case 0:
          if (v266) {
            goto LABEL_140;
          }
          v266 = @"kMRMediaRemoteNowPlayingInfoTypeAudio";
          goto LABEL_139;
        case 1:
          v269 = kMRMediaRemoteMediaTypeMusic;
          goto LABEL_137;
        case 2:
        case 3:
          v269 = kMRMediaRemoteNowPlayingInfoTypeVideo;
          goto LABEL_137;
        case 4:
          v269 = kMRMediaRemoteMediaTypePodcast;
          goto LABEL_137;
        case 5:
          v269 = kMRMediaRemoteMediaTypeAudioBook;
          goto LABEL_137;
        case 6:
          v269 = kMRMediaRemoteMediaTypeITunesU;
LABEL_137:
          v270 = *v269;
          break;
        default:
          v270 = @"kMRMediaRemoteNowPlayingInfoTypeAudio";
          break;
      }
      v271 = v270;

      v266 = v271;
    }
LABEL_139:
    if (v266)
    {
LABEL_140:
      [v5 setObject:v266 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoMediaType"];
    }
  }
  v272 = [(MRContentItem *)self availableLanguageOptions];

  if (v272)
  {
    v273 = [(MRContentItem *)self availableLanguageOptions];
    ExternalRepresentation = (void *)MRLanguageOptionGroupsCreateExternalRepresentation((uint64_t)v273);

    if (ExternalRepresentation) {
      [v5 setObject:ExternalRepresentation forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAvailableLanguageOptionsData"];
    }
  }
  v275 = [(MRContentItem *)self currentLanguageOptions];

  if (v275)
  {
    v276 = [(MRContentItem *)self currentLanguageOptions];
    v277 = (void *)MRLanguageOptionsCreateExternalRepresentation((uint64_t)v276);

    if (v277) {
      [v5 setObject:v277 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoCurrentLanguageOptionsData"];
    }
  }
  v278 = [(MRContentItem *)self metadata];
  v279 = [v278 artworkMIMEType];

  if (v279)
  {
    v280 = [(MRContentItem *)self metadata];
    v281 = [v280 artworkMIMEType];
    [v5 setObject:v281 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkMIMEType"];
  }
  v282 = [(MRContentItem *)self artwork];
  v283 = [v282 imageData];

  if (v283)
  {
    v284 = [(MRContentItem *)self artwork];
    v285 = [v284 imageData];
    [v5 setObject:v285 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkData"];
  }
  v286 = [(MRContentItem *)self artwork];
  uint64_t v287 = [v286 width];

  if (v287 >= 1)
  {
    v288 = NSNumber;
    v289 = [(MRContentItem *)self artwork];
    v290 = objc_msgSend(v288, "numberWithInteger:", objc_msgSend(v289, "width"));
    [v5 setObject:v290 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkDataWidth"];
  }
  v291 = [(MRContentItem *)self artwork];
  uint64_t v292 = [v291 height];

  if (v292 >= 1)
  {
    v293 = NSNumber;
    v294 = [(MRContentItem *)self artwork];
    v295 = objc_msgSend(v293, "numberWithInteger:", objc_msgSend(v294, "height"));
    [v5 setObject:v295 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkDataHeight"];
  }
  v296 = (NSDictionary *)v5;

  return v296;
}

- (MRContentItemMetadata)metadata
{
  v2 = self;
  objc_sync_enter(v2);
  metadata = v2->_metadata;
  if (!metadata)
  {
    id v4 = objc_alloc_init(MRContentItemMetadata);
    id v5 = v2->_metadata;
    v2->_metadata = v4;

    metadata = v2->_metadata;
  }
  v6 = metadata;
  objc_sync_exit(v2);

  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRContentItem *)self dictionaryRepresentation];
  v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

+ (id)mergeContentItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "identifier", (void)v17);
        v12 = [v4 objectForKeyedSubscript:v11];

        if (v12)
        {
          [v12 mergeFrom:v10];
        }
        else
        {
          v13 = (void *)[v10 copy];
          v14 = [v10 identifier];
          [v4 setObject:v13 forKeyedSubscript:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v15 = [v4 allValues];

  return v15;
}

- (NSData)data
{
  v2 = [(MRContentItem *)self protobufWithEncoding:0];
  id v3 = [v2 data];

  return (NSData *)v3;
}

- (MRContentItem)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[_MRContentItemProtobuf alloc] initWithData:v4];

    self = [(MRContentItem *)self initWithProtobuf:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (MRContentItem)skeleton
{
  id v3 = [MRContentItem alloc];
  id v4 = [(MRContentItem *)self identifier];
  id v5 = [(MRContentItem *)v3 initWithIdentifier:v4];

  uint64_t v6 = [(MRContentItem *)self parentIdentifier];
  [(MRContentItem *)v5 setParentIdentifier:v6];

  uint64_t v7 = [(MRContentItem *)self ancestorIdentifier];
  [(MRContentItem *)v5 setAncestorIdentifier:v7];

  uint64_t v8 = [(MRContentItem *)self associatedParticipantIdentifier];
  [(MRContentItem *)v5 setAssociatedParticipantIdentifier:v8];

  return v5;
}

- (MRContentItem)initWithProtobuf:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 identifier];
    uint64_t v7 = [(MRContentItem *)self initWithIdentifier:v6];

    if (v7)
    {
      uint64_t v8 = [v5 info];
      uint64_t v9 = [v8 copy];
      info = v7->_info;
      v7->_info = (NSString *)v9;

      v11 = [v5 parentIdentifier];
      uint64_t v12 = [v11 copy];
      parentIdentifier = v7->_parentIdentifier;
      v7->_parentIdentifier = (NSString *)v12;

      v14 = [v5 ancestorIdentifier];
      uint64_t v15 = [v14 copy];
      ancestorIdentifier = v7->_ancestorIdentifier;
      v7->_ancestorIdentifier = (NSString *)v15;

      long long v17 = [v5 associatedParticipantIdentifier];
      uint64_t v18 = [v17 copy];
      associatedParticipantIdentifier = v7->_associatedParticipantIdentifier;
      v7->_associatedParticipantIdentifier = (NSString *)v18;

      long long v20 = [v5 queueIdentifier];
      uint64_t v21 = [v20 copy];
      queueIdentifier = v7->_queueIdentifier;
      v7->_queueIdentifier = (NSString *)v21;

      v23 = [v5 requestIdentifier];
      uint64_t v24 = [v23 copy];
      requestIdentifier = v7->_requestIdentifier;
      v7->_requestIdentifier = (NSString *)v24;

      v26 = [[MRArtwork alloc] initWithProtobuf:v5];
      artwork = v7->_artwork;
      v7->_artwork = v26;

      if ([v5 hasMetadata])
      {
        uint64_t v28 = [MRContentItemMetadata alloc];
        v29 = [v5 metadata];
        uint64_t v30 = [(MRContentItemMetadata *)v28 initWithProtobuf:v29];
        metadata = v7->_metadata;
        v7->_metadata = (MRContentItemMetadata *)v30;
      }
      v32 = [v5 transcriptAlignments];
      uint64_t v33 = objc_msgSend(v32, "mr_map:", &__block_literal_global_75);
      transcriptAlignments = v7->_transcriptAlignments;
      v7->_transcriptAlignments = (NSArray *)v33;

      v35 = [v5 availableLanguageOptions];
      uint64_t v36 = objc_msgSend(v35, "mr_map:", &__block_literal_global_10_4);
      availableLanguageOptions = v7->_availableLanguageOptions;
      v7->_availableLanguageOptions = (NSArray *)v36;

      uint64_t v38 = [v5 currentLanguageOptions];
      uint64_t v39 = objc_msgSend(v38, "mr_map:", &__block_literal_global_14_1);
      currentLanguageOptions = v7->_currentLanguageOptions;
      v7->_currentLanguageOptions = (NSArray *)v39;

      uint64_t v41 = [v5 sections];
      uint64_t v42 = objc_msgSend(v41, "mr_map:", &__block_literal_global_18_0);
      sections = v7->_sections;
      v7->_sections = (NSArray *)v42;

      uint64_t v44 = [v5 availableArtworkFormats];
      availableArtworkFormats = v7->_availableArtworkFormats;
      v7->_availableArtworkFormats = (NSArray *)v44;

      uint64_t v46 = [v5 availableRemoteArtworkFormats];
      availableRemoteArtworkFormats = v7->_availableRemoteArtworkFormats;
      v7->_availableRemoteArtworkFormats = (NSArray *)v46;

      long long v76 = v5;
      if ([v5 dataArtworksCount])
      {
        char v48 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        uint64_t v49 = [v5 dataArtworks];
        uint64_t v50 = [v49 countByEnumeratingWithState:&v81 objects:v90 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v51; ++i)
            {
              if (*(void *)v82 != v52) {
                objc_enumerationMutation(v49);
              }
              v54 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              if ([v54 hasType])
              {
                int v55 = [MRDataArtwork alloc];
                uint64_t v56 = [v54 imageData];
                v57 = [(MRDataArtwork *)v55 initWithImageData:v56];
                v58 = [v54 type];
                [v48 setObject:v57 forKeyedSubscript:v58];
              }
              else
              {
                uint64_t v56 = _MRLogForCategory(0);
                if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                {
                  identifier = v7->_identifier;
                  *(_DWORD *)buf = 138412546;
                  v87 = v54;
                  __int16 v88 = 2112;
                  v89 = identifier;
                  _os_log_fault_impl(&dword_194F3C000, v56, OS_LOG_TYPE_FAULT, "FAULT: No type for artwork protobuf %@ in content item %@", buf, 0x16u);
                }
              }
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v81 objects:v90 count:16];
          }
          while (v51);
        }

        uint64_t v60 = [v48 copy];
        artworks = v7->_artworks;
        v7->_artworks = (NSDictionary *)v60;

        id v5 = v76;
      }
      if ([v5 remoteArtworksCount])
      {
        uint64_t v62 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        uint64_t v63 = [v5 remoteArtworks];
        uint64_t v64 = [v63 countByEnumeratingWithState:&v77 objects:v85 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v78;
          do
          {
            for (uint64_t j = 0; j != v65; ++j)
            {
              if (*(void *)v78 != v66) {
                objc_enumerationMutation(v63);
              }
              long long v68 = *(void **)(*((void *)&v77 + 1) + 8 * j);
              if ([v68 hasType])
              {
                long long v69 = [[MRRemoteArtwork alloc] initWithProtobuf:v68];
                char v70 = [v68 type];
                [v62 setObject:v69 forKeyedSubscript:v70];
              }
              else
              {
                _MRLogForCategory(0);
                long long v69 = (MRRemoteArtwork *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v69->super, OS_LOG_TYPE_FAULT))
                {
                  long long v71 = v7->_identifier;
                  *(_DWORD *)buf = 138412546;
                  v87 = v68;
                  __int16 v88 = 2112;
                  v89 = v71;
                  _os_log_fault_impl(&dword_194F3C000, &v69->super, OS_LOG_TYPE_FAULT, "FAULT: No type for artwork protobuf %@ in content item %@", buf, 0x16u);
                }
              }
            }
            uint64_t v65 = [v63 countByEnumeratingWithState:&v77 objects:v85 count:16];
          }
          while (v65);
        }

        uint64_t v72 = [v62 copy];
        remoteArtworks = v7->_remoteArtworks;
        v7->_remoteArtworks = (NSDictionary *)v72;

        id v5 = v76;
      }
    }
    self = v7;
    long long v74 = self;
  }
  else
  {
    long long v74 = 0;
  }

  return v74;
}

- (MRContentItem)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)MRContentItem;
    id v5 = [(MRContentItem *)&v9 init];
    uint64_t v6 = v5;
    if (v5) {
      [(MRContentItem *)v5 setIdentifier:v4];
    }
    self = v6;
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isEffectivelyEqual:(id)a3
{
  id v4 = a3;
  int v5 = _AXSHapticMusicEnabled();
  uint64_t v6 = (void *)[(MRContentItem *)self copy];
  uint64_t v7 = (void *)[v4 copy];
  uint64_t v8 = [v6 metadata];
  [v8 setHasElapsedTime:0];

  objc_super v9 = [v6 metadata];
  [v9 setHasElapsedTimeTimestamp:0];

  v10 = [v6 metadata];
  [v10 setHasInferredTimestamp:0];

  v11 = [v7 metadata];
  [v11 setHasElapsedTime:0];

  uint64_t v12 = [v7 metadata];
  [v12 setHasElapsedTimeTimestamp:0];

  v13 = [v7 metadata];
  [v13 setHasInferredTimestamp:0];

  BOOL v14 = 0;
  if ([v6 isEqual:v7])
  {
    BOOL v15 = v5 == 0;
    v16 = [(MRContentItem *)self metadata];
    [v16 calculatedPlaybackPosition];
    double v18 = v17;
    long long v19 = [v4 metadata];
    [v19 calculatedPlaybackPosition];
    BOOL v14 = vabdd_f64(v18, v20) < dbl_195224510[v15];
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRContentItem *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_66:
      char v11 = 0;
      goto LABEL_67;
    }
    int v5 = [(MRContentItem *)v4 identifier];
    uint64_t v6 = [(MRContentItem *)self identifier];
    if (v5 == (void *)v6)
    {
    }
    else
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = [(MRContentItem *)v4 identifier];
      objc_super v9 = [(MRContentItem *)self identifier];
      int v10 = [v8 isEqualToString:v9];

      if (!v10) {
        goto LABEL_66;
      }
    }
    uint64_t v12 = [(MRContentItem *)v4 metadata];
    uint64_t v13 = [(MRContentItem *)self metadata];
    if (v12 == (void *)v13)
    {
    }
    else
    {
      BOOL v14 = (void *)v13;
      BOOL v15 = [(MRContentItem *)v4 metadata];
      v16 = [(MRContentItem *)self metadata];
      int v17 = [v15 isEqual:v16];

      if (!v17) {
        goto LABEL_66;
      }
    }
    double v18 = [(MRContentItem *)v4 info];
    uint64_t v19 = [(MRContentItem *)self info];
    if (v18 == (void *)v19)
    {
    }
    else
    {
      double v20 = (void *)v19;
      uint64_t v21 = [(MRContentItem *)v4 info];
      uint64_t v22 = [(MRContentItem *)self info];
      int v23 = [v21 isEqualToString:v22];

      if (!v23) {
        goto LABEL_66;
      }
    }
    uint64_t v24 = [(MRContentItem *)v4 transcriptAlignments];
    uint64_t v25 = [(MRContentItem *)self transcriptAlignments];
    if (v24 == (void *)v25)
    {
    }
    else
    {
      v26 = (void *)v25;
      v27 = [(MRContentItem *)v4 transcriptAlignments];
      uint64_t v28 = [(MRContentItem *)self transcriptAlignments];
      int v29 = [v27 isEqualToArray:v28];

      if (!v29) {
        goto LABEL_66;
      }
    }
    uint64_t v30 = [(MRContentItem *)v4 availableLanguageOptions];
    uint64_t v31 = [(MRContentItem *)self availableLanguageOptions];
    if (v30 == (void *)v31)
    {
    }
    else
    {
      v32 = (void *)v31;
      uint64_t v33 = [(MRContentItem *)v4 availableLanguageOptions];
      int v34 = [(MRContentItem *)self availableLanguageOptions];
      int v35 = [v33 isEqualToArray:v34];

      if (!v35) {
        goto LABEL_66;
      }
    }
    uint64_t v36 = [(MRContentItem *)v4 currentLanguageOptions];
    uint64_t v37 = [(MRContentItem *)self currentLanguageOptions];
    if (v36 == (void *)v37)
    {
    }
    else
    {
      uint64_t v38 = (void *)v37;
      uint64_t v39 = [(MRContentItem *)v4 currentLanguageOptions];
      uint64_t v40 = [(MRContentItem *)self currentLanguageOptions];
      int v41 = [v39 isEqualToArray:v40];

      if (!v41) {
        goto LABEL_66;
      }
    }
    uint64_t v42 = [(MRContentItem *)v4 sections];
    uint64_t v43 = [(MRContentItem *)self sections];
    if (v42 == (void *)v43)
    {
    }
    else
    {
      uint64_t v44 = (void *)v43;
      v45 = [(MRContentItem *)v4 sections];
      uint64_t v46 = [(MRContentItem *)self sections];
      int v47 = [v45 isEqualToArray:v46];

      if (!v47) {
        goto LABEL_66;
      }
    }
    char v48 = [(MRContentItem *)v4 parentIdentifier];
    uint64_t v49 = [(MRContentItem *)self parentIdentifier];
    if (v48 == (void *)v49)
    {
    }
    else
    {
      uint64_t v50 = (void *)v49;
      uint64_t v51 = [(MRContentItem *)v4 parentIdentifier];
      uint64_t v52 = [(MRContentItem *)self parentIdentifier];
      int v53 = [v51 isEqualToString:v52];

      if (!v53) {
        goto LABEL_66;
      }
    }
    v54 = [(MRContentItem *)v4 ancestorIdentifier];
    uint64_t v55 = [(MRContentItem *)self ancestorIdentifier];
    if (v54 == (void *)v55)
    {
    }
    else
    {
      uint64_t v56 = (void *)v55;
      v57 = [(MRContentItem *)v4 ancestorIdentifier];
      v58 = [(MRContentItem *)self ancestorIdentifier];
      int v59 = [v57 isEqualToString:v58];

      if (!v59) {
        goto LABEL_66;
      }
    }
    uint64_t v60 = [(MRContentItem *)v4 associatedParticipantIdentifier];
    uint64_t v61 = [(MRContentItem *)self associatedParticipantIdentifier];
    if (v60 == (void *)v61)
    {
    }
    else
    {
      uint64_t v62 = (void *)v61;
      uint64_t v63 = [(MRContentItem *)v4 associatedParticipantIdentifier];
      uint64_t v64 = [(MRContentItem *)self associatedParticipantIdentifier];
      int v65 = [v63 isEqualToString:v64];

      if (!v65) {
        goto LABEL_66;
      }
    }
    uint64_t v66 = [(MRContentItem *)v4 queueIdentifier];
    uint64_t v67 = [(MRContentItem *)self queueIdentifier];
    if (v66 == (void *)v67)
    {
    }
    else
    {
      long long v68 = (void *)v67;
      long long v69 = [(MRContentItem *)v4 queueIdentifier];
      char v70 = [(MRContentItem *)self queueIdentifier];
      int v71 = [v69 isEqualToString:v70];

      if (!v71) {
        goto LABEL_66;
      }
    }
    uint64_t v72 = [(MRContentItem *)v4 requestIdentifier];
    uint64_t v73 = [(MRContentItem *)self requestIdentifier];
    if (v72 == (void *)v73)
    {
    }
    else
    {
      long long v74 = (void *)v73;
      long long v75 = [(MRContentItem *)v4 requestIdentifier];
      long long v76 = [(MRContentItem *)self requestIdentifier];
      int v77 = [v75 isEqualToString:v76];

      if (!v77) {
        goto LABEL_66;
      }
    }
    id v78 = [(MRContentItem *)v4 availableArtworkFormats];
    id v79 = [(MRContentItem *)self availableArtworkFormats];
    if (v78 == v79)
    {
    }
    else
    {
      long long v80 = v79;
      char v81 = [v78 isEqual:v79];

      if ((v81 & 1) == 0) {
        goto LABEL_66;
      }
    }
    id v82 = [(MRContentItem *)v4 availableRemoteArtworkFormats];
    id v83 = [(MRContentItem *)self availableRemoteArtworkFormats];
    if (v82 == v83)
    {
    }
    else
    {
      long long v84 = v83;
      char v85 = [v82 isEqual:v83];

      if ((v85 & 1) == 0) {
        goto LABEL_66;
      }
    }
    v86 = [(MRContentItem *)v4 artwork];
    uint64_t v87 = [(MRContentItem *)self artwork];
    if (v86 == (void *)v87)
    {
    }
    else
    {
      __int16 v88 = (void *)v87;
      v89 = [(MRContentItem *)v4 artwork];
      v90 = [(MRContentItem *)self artwork];
      int v91 = [v89 isEqual:v90];

      if (!v91) {
        goto LABEL_66;
      }
    }
    id v92 = [(MRContentItem *)v4 artworks];
    id v93 = [(MRContentItem *)self artworks];
    if (v92 == v93)
    {
    }
    else
    {
      v94 = v93;
      char v95 = [v92 isEqual:v93];

      if ((v95 & 1) == 0) {
        goto LABEL_66;
      }
    }
    v97 = [(MRContentItem *)v4 remoteArtworks];
    int v98 = [(MRContentItem *)self remoteArtworks];
    if (v97 == v98) {
      char v11 = 1;
    }
    else {
      char v11 = [v97 isEqual:v98];
    }
  }
LABEL_67:

  return v11;
}

- (void)setNowPlayingInfo:(id)a3 policy:(unsigned __int8)a4 request:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = (void *)[v8 mutableCopy];
  if (v10)
  {
    id v198 = v8;
    char v11 = [(MRContentItem *)self metadata];

    if (!v11)
    {
      uint64_t v12 = objc_alloc_init(MRContentItemMetadata);
      [(MRContentItem *)self setMetadata:v12];
    }
    int v195 = v6;
    if (!v6)
    {
      uint64_t v13 = [(MRContentItem *)self metadata];
      BOOL v14 = [v13 nowPlayingInfo];
      BOOL v15 = (void *)[v14 copy];

      v214[0] = MEMORY[0x1E4F143A8];
      v214[1] = 3221225472;
      v214[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke;
      v214[3] = &unk_1E57D48B0;
      id v215 = v10;
      [v15 enumerateKeysAndObjectsUsingBlock:v214];
    }
    if ((!v9 || [v9 includeMetadata])
      && (v213[0] = MEMORY[0x1E4F143A8],
          v213[1] = 3221225472,
          v213[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_2,
          v213[3] = &unk_1E57D6820,
          v213[4] = self,
          _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoAlbum", v213),
          !v9)
      || [v9 includeMetadata])
    {
      v212[0] = MEMORY[0x1E4F143A8];
      v212[1] = 3221225472;
      v212[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_3;
      v212[3] = &unk_1E57D6820;
      v212[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoArtist", v212);
      if (!v9) {
        goto LABEL_261;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_261:
      v16 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAssetURL"];
      if (v16)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        double v18 = v16;
        if ((isKindOfClass & 1) == 0) {
          double v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v16];
        }
        uint64_t v19 = [(MRContentItem *)self metadata];
        [v19 setAssetURL:v18];

        if ((isKindOfClass & 1) == 0) {
      }
        }

      if (!v9) {
        goto LABEL_259;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_259:
      v211[0] = MEMORY[0x1E4F143A8];
      v211[1] = 3221225472;
      v211[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_4;
      v211[3] = &unk_1E57D6820;
      v211[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoComposer", v211);
      if (!v9) {
        goto LABEL_257;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_257:
      double v20 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDiscNumber"];
      uint64_t v21 = v20;
      if (v20)
      {
        uint64_t v22 = [v20 longValue];
        int v23 = [(MRContentItem *)self metadata];
        [v23 setDiscNumber:v22];
      }
      if (!v9) {
        goto LABEL_255;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_255:
      v210[0] = MEMORY[0x1E4F143A8];
      v210[1] = 3221225472;
      v210[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_5;
      v210[3] = &unk_1E57D6820;
      v210[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoGenre", v210);
      if (!v9) {
        goto LABEL_253;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_253:
      uint64_t v24 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoPlaybackRate"];
      uint64_t v25 = v24;
      if (v24)
      {
        [v24 floatValue];
        int v27 = v26;
        uint64_t v28 = [(MRContentItem *)self metadata];
        LODWORD(v29) = v27;
        [v28 setPlaybackRate:v29];
      }
      if (!v9) {
        goto LABEL_251;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_251:
      uint64_t v30 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoCurrentPlaybackDate"];
      if (v30)
      {
        uint64_t v31 = [(MRContentItem *)self metadata];
        [v31 setCurrentPlaybackDate:v30];
      }
      if (!v9) {
        goto LABEL_249;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_249:
      v32 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsAlwaysLive"];
      uint64_t v33 = v32;
      if (v32)
      {
        uint64_t v34 = [v32 BOOLValue];
        int v35 = [(MRContentItem *)self metadata];
        [v35 setAlwaysLive:v34];
      }
      if (!v9) {
        goto LABEL_39;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_39:
      uint64_t v36 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsInTransition"];
      uint64_t v37 = v36;
      if (v36)
      {
        uint64_t v38 = [v36 BOOLValue];
        uint64_t v39 = [(MRContentItem *)self metadata];
        [v39 setInTransition:v38];
      }
    }
    uint64_t v40 = [(MRContentItem *)self metadata];
    char v41 = [v40 isAlwaysLive];

    if ((v41 & 1) == 0)
    {
      if (!v9 || [v9 includeMetadata])
      {
        uint64_t v42 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDuration"];
        uint64_t v43 = v42;
        if (v42)
        {
          [v42 doubleValue];
          double v45 = v44;
          uint64_t v46 = [(MRContentItem *)self metadata];
          [v46 setDuration:v45];
        }
        if (!v9) {
          goto LABEL_49;
        }
      }
      if ([v9 includeMetadata])
      {
LABEL_49:
        int v47 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoElapsedTime"];
        char v48 = v47;
        if (v47)
        {
          [v47 doubleValue];
          double v50 = v49;
          uint64_t v51 = [(MRContentItem *)self metadata];
          [v51 setElapsedTime:v50];
        }
      }
    }
    uint64_t v52 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTimestamp"];
    int v53 = v52;
    if (v52)
    {
      v54 = NSNumber;
      [v52 timeIntervalSinceReferenceDate];
      uint64_t v55 = objc_msgSend(v54, "numberWithDouble:");
      [v10 setObject:v55 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTimestamp"];
    }
    if (!v9 || [v9 includeMetadata])
    {
      uint64_t v56 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTimestamp"];
      v57 = v56;
      if (v56)
      {
        [v56 doubleValue];
        double v59 = v58;
        uint64_t v60 = [(MRContentItem *)self metadata];
        [v60 setElapsedTimeTimestamp:v59];
      }
    }
    uint64_t v61 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoStartTime"];
    uint64_t v62 = v61;
    if (v61)
    {
      uint64_t v63 = NSNumber;
      [v61 timeIntervalSinceReferenceDate];
      uint64_t v64 = objc_msgSend(v63, "numberWithDouble:");
      [v10 setObject:v64 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoStartTime"];
    }
    if (!v9 || [v9 includeMetadata])
    {
      int v65 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoStartTime"];
      uint64_t v66 = v65;
      if (v65)
      {
        [v65 doubleValue];
        double v68 = v67;
        long long v69 = [(MRContentItem *)self metadata];
        [v69 setStartTime:v68];
      }
      if (!v9) {
        goto LABEL_290;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_290:
      v209[0] = MEMORY[0x1E4F143A8];
      v209[1] = 3221225472;
      v209[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_6;
      v209[3] = &unk_1E57D6820;
      v209[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoTitle", v209);
      if (!v9) {
        goto LABEL_289;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_289:
      char v70 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTotalDiscCount"];
      int v71 = v70;
      if (v70)
      {
        uint64_t v72 = [v70 longValue];
        uint64_t v73 = [(MRContentItem *)self metadata];
        [v73 setTotalDiscCount:v72];
      }
      if (!v9) {
        goto LABEL_288;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_288:
      long long v74 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTotalTrackCount"];
      long long v75 = v74;
      if (v74)
      {
        uint64_t v76 = [v74 longValue];
        int v77 = [(MRContentItem *)self metadata];
        [v77 setTotalTrackCount:v76];
      }
      if (!v9) {
        goto LABEL_287;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_287:
      id v78 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTrackNumber"];
      id v79 = v78;
      if (v78)
      {
        uint64_t v80 = [v78 longValue];
        char v81 = [(MRContentItem *)self metadata];
        [v81 setTrackNumber:v80];
      }
      if (!v9) {
        goto LABEL_286;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_286:
      v208[0] = MEMORY[0x1E4F143A8];
      v208[1] = 3221225472;
      v208[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_7;
      v208[3] = &unk_1E57D6820;
      v208[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoCollectionIdentifier", v208);
      if (!v9) {
        goto LABEL_285;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_285:
      v207[0] = MEMORY[0x1E4F143A8];
      v207[1] = 3221225472;
      v207[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_8;
      v207[3] = &unk_1E57D6820;
      v207[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoExternalContentIdentifier", v207);
      if (!v9) {
        goto LABEL_284;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_284:
      v206[0] = MEMORY[0x1E4F143A8];
      v206[1] = 3221225472;
      v206[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_9;
      v206[3] = &unk_1E57D6820;
      v206[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoInternationalStandardRecordingCode", v206);
      if (!v9) {
        goto LABEL_283;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_283:
      id v82 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoExcludeFromSuggestions"];
      id v83 = v82;
      if (v82)
      {
        uint64_t v84 = [v82 BOOLValue];
        char v85 = [(MRContentItem *)self metadata];
        [v85 setExcludeFromSuggestions:v84];
      }
      if (!v9) {
        goto LABEL_282;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_282:
      v205[0] = MEMORY[0x1E4F143A8];
      v205[1] = 3221225472;
      v205[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_10;
      v205[3] = &unk_1E57D6820;
      v205[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoExternalProfileIdentifier", v205);
      if (!v9) {
        goto LABEL_281;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_281:
      v204[0] = MEMORY[0x1E4F143A8];
      v204[1] = 3221225472;
      v204[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_11;
      v204[3] = &unk_1E57D6820;
      v204[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoServiceIdentifier", v204);
      if (!v9) {
        goto LABEL_280;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_280:
      v203[0] = MEMORY[0x1E4F143A8];
      v203[1] = 3221225472;
      v203[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_12;
      v203[3] = &unk_1E57D6820;
      v203[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoBrandIdentifier", v203);
      if (!v9) {
        goto LABEL_279;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_279:
      v86 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoPlaybackProgress"];
      uint64_t v87 = v86;
      if (v86)
      {
        [v86 floatValue];
        int v89 = v88;
        v90 = [(MRContentItem *)self metadata];
        LODWORD(v91) = v89;
        [v90 setPlaybackProgress:v91];
      }
      if (!v9) {
        goto LABEL_278;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_278:
      id v92 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsExplicitTrack"];
      id v93 = v92;
      if (v92)
      {
        uint64_t v94 = [v92 BOOLValue];
        char v95 = [(MRContentItem *)self metadata];
        [v95 setExplicitItem:v94];
      }
      if (!v9) {
        goto LABEL_277;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_277:
      v96 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsSharable"];
      v97 = v96;
      if (v96)
      {
        uint64_t v98 = [v96 BOOLValue];
        v99 = [(MRContentItem *)self metadata];
        [v99 setSharable:v98];
      }
      if (!v9) {
        goto LABEL_276;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_276:
      v100 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsLiked"];
      v101 = v100;
      if (v100)
      {
        uint64_t v102 = [v100 BOOLValue];
        v103 = [(MRContentItem *)self metadata];
        [v103 setLiked:v102];
      }
      if (!v9) {
        goto LABEL_275;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_275:
      v104 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsInWishList"];
      v105 = v104;
      if (v104)
      {
        uint64_t v106 = [v104 BOOLValue];
        v107 = [(MRContentItem *)self metadata];
        [v107 setInWishList:v106];
      }
      if (!v9) {
        goto LABEL_274;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_274:
      v108 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoRadioStationIdentifier"];
      v109 = v108;
      if (v108)
      {
        uint64_t v110 = [v108 longLongValue];
        v111 = [(MRContentItem *)self metadata];
        [v111 setRadioStationIdentifier:v110];
      }
      if (!v9) {
        goto LABEL_273;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_273:
      v202[0] = MEMORY[0x1E4F143A8];
      v202[1] = 3221225472;
      v202[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_13;
      v202[3] = &unk_1E57D6820;
      v202[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoRadioStationName", v202);
      if (!v9) {
        goto LABEL_272;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_272:
      v201[0] = MEMORY[0x1E4F143A8];
      v201[1] = 3221225472;
      v201[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_14;
      v201[3] = &unk_1E57D6820;
      v201[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoRadioStationStringIdentifier", v201);
      if (!v9) {
        goto LABEL_271;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_271:
      v112 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier"];
      v113 = v112;
      if (v112)
      {
        uint64_t v114 = [v112 longLongValue];
        v115 = [(MRContentItem *)self metadata];
        [v115 setITunesStoreIdentifier:v114];
      }
      if (!v9) {
        goto LABEL_270;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_270:
      v116 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoiTunesStoreSubscriptionAdamIdentifier"];
      v117 = v116;
      if (v116)
      {
        uint64_t v118 = [v116 longLongValue];
        v119 = [(MRContentItem *)self metadata];
        [v119 setITunesStoreSubscriptionIdentifier:v118];
      }
      if (!v9) {
        goto LABEL_269;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_269:
      v120 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtistiTunesStoreAdamIdentifier"];
      v121 = v120;
      if (v120)
      {
        uint64_t v122 = [v120 longLongValue];
        int v123 = [(MRContentItem *)self metadata];
        [v123 setITunesStoreArtistIdentifier:v122];
      }
      if (!v9) {
        goto LABEL_268;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_268:
      v124 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAlbumiTunesStoreAdamIdentifier"];
      v125 = v124;
      if (v124)
      {
        uint64_t v126 = [v124 longLongValue];
        v127 = [(MRContentItem *)self metadata];
        [v127 setITunesStoreAlbumIdentifier:v126];
      }
      if (!v9) {
        goto LABEL_267;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_267:
      int v128 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoPurchaseInfoData"];
      if (v128)
      {
        v129 = [(MRContentItem *)self metadata];
        [v129 setPurchaseInfoData:v128];
      }
      if (!v9) {
        goto LABEL_266;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_266:
      v130 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate"];
      v131 = v130;
      if (v130)
      {
        [v130 floatValue];
        int v133 = v132;
        v134 = [(MRContentItem *)self metadata];
        LODWORD(v135) = v133;
        [v134 setDefaultPlaybackRate:v135];
      }
      if (!v9) {
        goto LABEL_265;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_265:
      v136 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDownloadState"];
      v137 = v136;
      if (v136)
      {
        uint64_t v138 = (int)[v136 intValue];
        v139 = [(MRContentItem *)self metadata];
        [v139 setDownloadState:v138];
      }
      if (!v9) {
        goto LABEL_264;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_264:
      v140 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDownloadProgress"];
      v141 = v140;
      if (v140)
      {
        [v140 floatValue];
        int v143 = v142;
        v144 = [(MRContentItem *)self metadata];
        LODWORD(v145) = v143;
        [v144 setDownloadProgress:v145];
      }
      if (!v9) {
        goto LABEL_263;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_263:
      v146 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAppMetrics"];
      if (v146)
      {
        v147 = [(MRContentItem *)self metadata];
        [v147 setAppMetrics:v146];
      }
      if (!v9) {
        goto LABEL_262;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_262:
      int v148 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoCollectionInfo"];
      if (v148)
      {
        v149 = [(MRContentItem *)self metadata];
        [v149 setCollectionInfo:v148];
      }
      if (!v9) {
        goto LABEL_260;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_260:
      v200[0] = MEMORY[0x1E4F143A8];
      v200[1] = 3221225472;
      v200[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_15;
      v200[3] = &unk_1E57D6820;
      v200[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoArtworkMIMEType", v200);
      if (!v9) {
        goto LABEL_258;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_258:
      v150 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsAdvertisement"];
      v151 = v150;
      if (v150)
      {
        uint64_t v152 = [v150 BOOLValue];
        v153 = [(MRContentItem *)self metadata];
        [v153 setAdvertisement:v152];
      }
      if (!v9) {
        goto LABEL_256;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_256:
      v154 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsSteerable"];
      v155 = v154;
      if (v154)
      {
        uint64_t v156 = [v154 BOOLValue];
        int v157 = [(MRContentItem *)self metadata];
        [v157 setSteerable:v156];
      }
      if (!v9) {
        goto LABEL_254;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_254:
      v199[0] = MEMORY[0x1E4F143A8];
      v199[1] = 3221225472;
      v199[2] = __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_16;
      v199[3] = &unk_1E57D6820;
      v199[4] = self;
      _MRReadNowPlayingInfoString(v10, @"kMRMediaRemoteNowPlayingInfoArtworkIdentifier", v199);
      if (!v9) {
        goto LABEL_252;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_252:
      v158 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkURL"];
      if (v158)
      {
        v159 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v158];
        v160 = [(MRContentItem *)self metadata];
        [v160 setArtworkURL:v159];
      }
      if (!v9) {
        goto LABEL_250;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_250:
      v161 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoUniqueIdentifier"];
      int v162 = v161;
      if (v161)
      {
        uint64_t v163 = [v161 longLongValue];
        v164 = [(MRContentItem *)self metadata];
        [v164 setLegacyUniqueIdentifier:v163];
      }
      if (!v9) {
        goto LABEL_185;
      }
    }
    if ([v9 includeMetadata])
    {
LABEL_185:
      v165 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoUserInfo"];
      if (v165)
      {
        v166 = [(MRContentItem *)self metadata];
        [v166 setUserInfo:v165];
      }
    }
    int v196 = v62;
    v197 = v53;
    int v167 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoMediaType"];
    v168 = v167;
    if (!v167)
    {
LABEL_201:
      int v177 = objc_msgSend(v10, "objectForKeyedSubscript:");
      if ((!v9 || [v9 includeLanguageOptions]) && v177)
      {
        v178 = (void *)MRLanguageOptionsCreateFromExternalRepresentation(v177);
        if (v178)
        {
          [(MRContentItem *)self setCurrentLanguageOptions:v178];
          v179 = [(MRContentItem *)self metadata];
          [v179 setLanguageOptionsAvailable:1];
        }
      }

      uint64_t v180 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAvailableLanguageOptionsData"];
      v181 = (void *)v180;
      if (v9)
      {
        if (![v9 includeLanguageOptions] || !v181)
        {

          goto LABEL_215;
        }
      }
      else if (!v180)
      {
        goto LABEL_216;
      }
      v182 = (void *)MRLanguageOptionGroupsCreateFromExternalRepresentation(v181);
      if (v182)
      {
        [(MRContentItem *)self setAvailableLanguageOptions:v182];
        v183 = [(MRContentItem *)self metadata];
        [v183 setLanguageOptionsAvailable:1];
      }
      if (v9)
      {
LABEL_215:
        if (![v9 includeArtwork]) {
          goto LABEL_232;
        }
      }
LABEL_216:
      if (v195)
      {
        v184 = 0;
      }
      else
      {
        v184 = [(MRContentItem *)self artwork];
      }
      v185 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkData"];
      if (v185)
      {
        if (!v184) {
          v184 = objc_alloc_init(MRArtwork);
        }
        [(MRArtwork *)v184 setImageData:v185];
      }
      int v186 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkDataHeight"];
      if (v186)
      {
        if (!v184) {
          v184 = objc_alloc_init(MRArtwork);
        }
        -[MRArtwork setHeight:](v184, "setHeight:", [v186 longValue]);
      }
      v187 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkDataWidth"];
      if (v187)
      {
        if (!v184) {
          v184 = objc_alloc_init(MRArtwork);
        }
        -[MRArtwork setWidth:](v184, "setWidth:", [v187 longValue]);
      }
      [(MRContentItem *)self setArtwork:v184];

LABEL_232:
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoContentItemIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAlbum"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtist"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAssetURL"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoComposer"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDiscNumber"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoGenre"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoPlaybackRate"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoCurrentPlaybackDate"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsAlwaysLive"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsInTransition"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDuration"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoElapsedTime"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTimestamp"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoStartTime"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTitle"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTotalDiscCount"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTotalTrackCount"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoTrackNumber"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoCollectionIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoExternalContentIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoInternationalStandardRecordingCode"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoExcludeFromSuggestions"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoExternalProfileIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoServiceIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoBrandIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoPlaybackProgress"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsExplicitTrack"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsSharable"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsLiked"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsInWishList"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoRadioStationIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoRadioStationName"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoRadioStationStringIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoiTunesStoreSubscriptionAdamIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtistiTunesStoreAdamIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAlbumiTunesStoreAdamIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoPurchaseInfoData"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDownloadState"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoDownloadProgress"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAppMetrics"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoCollectionInfo"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkMIMEType"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsAdvertisement"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoIsSteerable"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkURL"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoUniqueIdentifier"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoUserInfo"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoCurrentLanguageOptionsData"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoAvailableLanguageOptionsData"];
      [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoArtworkData"];
      v188 = [(MRContentItem *)self metadata];
      uint64_t v189 = [v188 nowPlayingInfo];
      if ((void *)v189 == v10)
      {
      }
      else
      {
        v190 = (void *)v189;
        int v191 = [(MRContentItem *)self metadata];
        v192 = [v191 nowPlayingInfo];
        char v193 = [v192 isEqualToDictionary:v10];

        if (v193)
        {
LABEL_237:

          id v8 = v198;
          goto LABEL_238;
        }
        v188 = [(MRContentItem *)self metadata];
        [v188 setNowPlayingInfo:v10];
      }

      goto LABEL_237;
    }
    if ([v167 isEqualToString:@"kMRMediaRemoteNowPlayingInfoTypeAudio"])
    {
      uint64_t v169 = 0;
    }
    else
    {
      if ([v168 isEqualToString:@"kMRMediaRemoteNowPlayingInfoTypeVideo"])
      {
        uint64_t v169 = 0;
        uint64_t v170 = 2;
LABEL_196:
        v171 = [(MRContentItem *)self metadata];
        char v172 = [v171 hasMediaType];

        if ((v172 & 1) == 0)
        {
          v173 = [(MRContentItem *)self metadata];
          [v173 setMediaType:v170];
        }
        v174 = [(MRContentItem *)self metadata];
        char v175 = [v174 hasMediaSubType];

        if ((v175 & 1) == 0)
        {
          v176 = [(MRContentItem *)self metadata];
          [v176 setMediaSubType:v169];
        }
        [v10 setObject:0 forKeyedSubscript:@"kMRMediaRemoteNowPlayingInfoMediaType"];
        goto LABEL_201;
      }
      if (([v168 isEqualToString:@"MRMediaRemoteMediaTypeMusic"] & 1) == 0)
      {
        if ([v168 isEqualToString:@"MRMediaRemoteMediaTypePodcast"])
        {
          uint64_t v170 = 1;
          uint64_t v169 = 4;
        }
        else if ([v168 isEqualToString:@"MRMediaRemoteMediaTypeAudioBook"])
        {
          uint64_t v170 = 1;
          uint64_t v169 = 5;
        }
        else
        {
          unsigned int v194 = [v168 isEqualToString:@"MRMediaRemoteMediaTypeITunesU"];
          if (v194) {
            uint64_t v169 = 6;
          }
          else {
            uint64_t v169 = 0;
          }
          uint64_t v170 = v194;
        }
        goto LABEL_196;
      }
      uint64_t v169 = 1;
    }
    uint64_t v170 = 1;
    goto LABEL_196;
  }
LABEL_238:
}

- (MRContentItem)initWithNowPlayingInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(id)objc_opt_class() extractedIdentifierFromNowPlayingInfo:v4];
    if (!v5)
    {
      int v6 = [MEMORY[0x1E4F29128] UUID];
      int v5 = [v6 UUIDString];
    }
    uint64_t v7 = [(MRContentItem *)self initWithIdentifier:v5];
    id v8 = v7;
    if (v7) {
      [(MRContentItem *)v7 setNowPlayingInfo:v4 policy:1 request:0];
    }
    self = v8;

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

MRTranscriptAlignment *__34__MRContentItem_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MRTranscriptAlignment alloc] initWithProtobuf:v2];

  return v3;
}

MRLanguageOptionGroup *__34__MRContentItem_initWithProtobuf___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MRLanguageOptionGroup alloc] initWithProtobuf:v2];

  return v3;
}

MRLanguageOption *__34__MRContentItem_initWithProtobuf___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MRLanguageOption alloc] initWithProtobuf:v2];

  return v3;
}

MRContentItem *__34__MRContentItem_initWithProtobuf___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MRContentItem alloc] initWithProtobuf:v2];

  return v3;
}

uint64_t __38__MRContentItem_protobufWithEncoding___block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

uint64_t __38__MRContentItem_protobufWithEncoding___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

uint64_t __38__MRContentItem_protobufWithEncoding___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

uint64_t __38__MRContentItem_protobufWithEncoding___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 protobufWithEncoding:*(void *)(a1 + 32)];
}

uint64_t __41__MRContentItem_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __41__MRContentItem_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __41__MRContentItem_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __41__MRContentItem_dictionaryRepresentation__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setAlbumName:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setTrackArtistName:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setComposer:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setGenre:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setTitle:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setCollectionIdentifier:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setContentIdentifier:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setInternationalStandardRecordingCode:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setProfileIdentifier:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setServiceIdentifier:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setBrandIdentifier:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setRadioStationName:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setRadioStationString:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setArtworkMIMEType:v3];
}

void __50__MRContentItem_setNowPlayingInfo_policy_request___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metadata];
  [v4 setArtworkIdentifier:v3];
}

+ (id)extractedIdentifierFromNowPlayingInfo:(id)a3
{
  if (!a3)
  {
    id v9 = 0;
    goto LABEL_12;
  }
  id v3 = a3;
  id v4 = [v3 objectForKey:@"kMRMediaRemoteNowPlayingInfoContentItemIdentifier"];
  id v5 = [v3 objectForKey:@"kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier"];
  int v6 = [v3 objectForKey:@"kMRMediaRemoteNowPlayingInfoExternalContentIdentifier"];
  id v7 = [v3 objectForKey:@"kMRMediaRemoteNowPlayingInfoUniqueIdentifier"];

  if (!v4)
  {
    if (v5)
    {
      int v10 = v5;
LABEL_7:
      id v8 = [v10 stringValue];
      goto LABEL_10;
    }
    if (v6)
    {
      id v8 = v6;
      goto LABEL_10;
    }
    if (v7)
    {
      if (objc_opt_respondsToSelector())
      {
        int v10 = v7;
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        goto LABEL_10;
      }
    }
    id v9 = 0;
    goto LABEL_11;
  }
  id v8 = v4;
LABEL_10:
  id v9 = v8;
LABEL_11:

LABEL_12:

  return v9;
}

id __30__MRContentItem_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];

  return v2;
}

id __30__MRContentItem_copyWithZone___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];

  return v2;
}

id __30__MRContentItem_copyWithZone___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];

  return v2;
}

id __30__MRContentItem_copyWithZone___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];

  return v2;
}

@end