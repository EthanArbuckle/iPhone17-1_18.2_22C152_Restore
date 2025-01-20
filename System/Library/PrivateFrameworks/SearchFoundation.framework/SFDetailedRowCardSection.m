@interface SFDetailedRowCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)buttonItemsAreTrailing;
- (BOOL)hasButtonItemsAreTrailing;
- (BOOL)hasIsSecondaryTitleDetached;
- (BOOL)hasPreventThumbnailImageScaling;
- (BOOL)hasShouldUseCompactDisplay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSecondaryTitleDetached;
- (BOOL)preventThumbnailImageScaling;
- (BOOL)shouldUseCompactDisplay;
- (NSArray)buttonItems;
- (NSArray)descriptions;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFActionItem)action;
- (SFButton)button;
- (SFDetailedRowCardSection)initWithCoder:(id)a3;
- (SFDetailedRowCardSection)initWithProtobuf:(id)a3;
- (SFFormattedText)secondaryTitle;
- (SFFormattedText)trailingBottomText;
- (SFFormattedText)trailingMiddleText;
- (SFFormattedText)trailingTopText;
- (SFImage)secondaryTitleImage;
- (SFImage)thumbnail;
- (SFImage)trailingThumbnail;
- (SFRichText)footnote;
- (SFRichText)richTrailingBottomText;
- (SFRichText)richTrailingMiddleText;
- (SFRichText)richTrailingTopText;
- (SFRichText)title;
- (SFRichText)topText;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonItems:(id)a3;
- (void)setButtonItemsAreTrailing:(BOOL)a3;
- (void)setDescriptions:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setIsSecondaryTitleDetached:(BOOL)a3;
- (void)setPreventThumbnailImageScaling:(BOOL)a3;
- (void)setRichTrailingBottomText:(id)a3;
- (void)setRichTrailingMiddleText:(id)a3;
- (void)setRichTrailingTopText:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSecondaryTitleImage:(id)a3;
- (void)setShouldUseCompactDisplay:(BOOL)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopText:(id)a3;
- (void)setTrailingBottomText:(id)a3;
- (void)setTrailingMiddleText:(id)a3;
- (void)setTrailingThumbnail:(id)a3;
- (void)setTrailingTopText:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SFDetailedRowCardSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richTrailingBottomText, 0);
  objc_storeStrong((id *)&self->_richTrailingMiddleText, 0);
  objc_storeStrong((id *)&self->_richTrailingTopText, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_trailingThumbnail, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_trailingBottomText, 0);
  objc_storeStrong((id *)&self->_trailingMiddleText, 0);
  objc_storeStrong((id *)&self->_trailingTopText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_secondaryTitleImage, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setRichTrailingBottomText:(id)a3
{
}

- (SFRichText)richTrailingBottomText
{
  return self->_richTrailingBottomText;
}

- (void)setRichTrailingMiddleText:(id)a3
{
}

- (SFRichText)richTrailingMiddleText
{
  return self->_richTrailingMiddleText;
}

- (void)setRichTrailingTopText:(id)a3
{
}

- (SFRichText)richTrailingTopText
{
  return self->_richTrailingTopText;
}

- (void)setTopText:(id)a3
{
}

- (SFRichText)topText
{
  return self->_topText;
}

- (BOOL)buttonItemsAreTrailing
{
  return self->_buttonItemsAreTrailing;
}

- (void)setTrailingThumbnail:(id)a3
{
}

- (SFImage)trailingThumbnail
{
  return self->_trailingThumbnail;
}

- (void)setButtonItems:(id)a3
{
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (BOOL)shouldUseCompactDisplay
{
  return self->_shouldUseCompactDisplay;
}

- (void)setButton:(id)a3
{
}

- (SFButton)button
{
  return self->_button;
}

- (void)setAction:(id)a3
{
}

- (SFActionItem)action
{
  return self->_action;
}

- (void)setTrailingBottomText:(id)a3
{
}

- (SFFormattedText)trailingBottomText
{
  return self->_trailingBottomText;
}

- (void)setTrailingMiddleText:(id)a3
{
}

- (SFFormattedText)trailingMiddleText
{
  return self->_trailingMiddleText;
}

- (void)setTrailingTopText:(id)a3
{
}

- (SFFormattedText)trailingTopText
{
  return self->_trailingTopText;
}

- (void)setFootnote:(id)a3
{
}

- (SFRichText)footnote
{
  return self->_footnote;
}

- (void)setDescriptions:(id)a3
{
}

- (NSArray)descriptions
{
  return self->_descriptions;
}

- (BOOL)isSecondaryTitleDetached
{
  return self->_isSecondaryTitleDetached;
}

- (void)setSecondaryTitleImage:(id)a3
{
}

- (SFImage)secondaryTitleImage
{
  return self->_secondaryTitleImage;
}

- (void)setSecondaryTitle:(id)a3
{
}

- (SFFormattedText)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setTitle:(id)a3
{
}

- (SFRichText)title
{
  return self->_title;
}

- (BOOL)preventThumbnailImageScaling
{
  return self->_preventThumbnailImageScaling;
}

- (void)setThumbnail:(id)a3
{
}

- (SFImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (unint64_t)hash
{
  v57.receiver = self;
  v57.super_class = (Class)SFDetailedRowCardSection;
  unint64_t v3 = [(SFCardSection *)&v57 hash];
  v56 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v56 hash];
  v55 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v55 hash];
  v54 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v54 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  v53 = [(SFDetailedRowCardSection *)self type];
  uint64_t v10 = v9 ^ [v53 hash];
  uint64_t v11 = v10 ^ [(SFCardSection *)self separatorStyle];
  v52 = [(SFCardSection *)self backgroundColor];
  uint64_t v12 = v11 ^ [v52 hash];
  v51 = [(SFDetailedRowCardSection *)self thumbnail];
  uint64_t v13 = v8 ^ v12 ^ [v51 hash];
  uint64_t v14 = [(SFDetailedRowCardSection *)self preventThumbnailImageScaling];
  v50 = [(SFDetailedRowCardSection *)self title];
  uint64_t v15 = v14 ^ [v50 hash];
  v49 = [(SFDetailedRowCardSection *)self secondaryTitle];
  uint64_t v16 = v15 ^ [v49 hash];
  v48 = [(SFDetailedRowCardSection *)self secondaryTitleImage];
  uint64_t v17 = v16 ^ [v48 hash];
  uint64_t v18 = v17 ^ [(SFDetailedRowCardSection *)self isSecondaryTitleDetached];
  v47 = [(SFDetailedRowCardSection *)self descriptions];
  uint64_t v19 = v13 ^ v18 ^ [v47 hash];
  v46 = [(SFDetailedRowCardSection *)self footnote];
  uint64_t v20 = [v46 hash];
  v45 = [(SFDetailedRowCardSection *)self trailingTopText];
  uint64_t v21 = v20 ^ [v45 hash];
  v44 = [(SFDetailedRowCardSection *)self trailingMiddleText];
  uint64_t v22 = v21 ^ [v44 hash];
  v43 = [(SFDetailedRowCardSection *)self trailingBottomText];
  uint64_t v23 = v22 ^ [v43 hash];
  v42 = [(SFDetailedRowCardSection *)self action];
  uint64_t v24 = v23 ^ [v42 hash];
  v25 = [(SFDetailedRowCardSection *)self button];
  uint64_t v26 = v24 ^ [v25 hash];
  uint64_t v27 = v26 ^ [(SFDetailedRowCardSection *)self shouldUseCompactDisplay];
  v28 = [(SFDetailedRowCardSection *)self buttonItems];
  uint64_t v29 = v19 ^ v27 ^ [v28 hash];
  v30 = [(SFDetailedRowCardSection *)self trailingThumbnail];
  uint64_t v31 = [v30 hash];
  uint64_t v32 = v31 ^ [(SFDetailedRowCardSection *)self buttonItemsAreTrailing];
  v33 = [(SFDetailedRowCardSection *)self topText];
  uint64_t v34 = v32 ^ [v33 hash];
  v35 = [(SFDetailedRowCardSection *)self richTrailingTopText];
  uint64_t v36 = v34 ^ [v35 hash];
  v37 = [(SFDetailedRowCardSection *)self richTrailingMiddleText];
  uint64_t v38 = v36 ^ [v37 hash];
  v39 = [(SFDetailedRowCardSection *)self richTrailingBottomText];
  unint64_t v40 = v29 ^ v38 ^ [v39 hash];

  return v40;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFDetailedRowCardSection *)a3;
  if (self == v6)
  {
    char v16 = 1;
    goto LABEL_147;
  }
  if (![(SFDetailedRowCardSection *)v6 isMemberOfClass:objc_opt_class()]
    || (v227.receiver = self,
        v227.super_class = (Class)SFDetailedRowCardSection,
        ![(SFCardSection *)&v227 isEqual:v6]))
  {
    char v16 = 0;
    goto LABEL_147;
  }
  uint64_t v7 = v6;
  unint64_t v8 = [(SFCardSection *)self punchoutOptions];
  uint64_t v9 = [(SFCardSection *)v7 punchoutOptions];
  id v221 = v9;
  id v222 = v8;
  int v219 = v9 != 0;
  int v220 = v8 == 0;
  if (v220 == v219)
  {
    uint64_t v218 = 0;
    int v209 = 0;
    int v207 = 0;
    long long v226 = 0uLL;
    uint64_t v205 = 0;
    memset(v204, 0, sizeof(v204));
    int v11 = 0;
    int v203 = 0;
    int v201 = 0;
    int v198 = 0;
    int v199 = 0;
    BOOL v225 = 0;
    int v193 = 0;
    int v195 = 0;
    BOOL v224 = 0;
    uint64_t v190 = 0;
    BOOL v223 = 0;
    int v187 = 0;
    int v191 = 0;
    BOOL v217 = 0;
    int v183 = 0;
    int v186 = 0;
    BOOL v216 = 0;
    int v178 = 0;
    int v184 = 0;
    BOOL v215 = 0;
    int v176 = 0;
    int v182 = 0;
    BOOL v214 = 0;
    int v174 = 0;
    int v180 = 0;
    BOOL v213 = 0;
    int v175 = 0;
    int v181 = 0;
    BOOL v212 = 0;
    int v177 = 0;
    int v179 = 0;
    BOOL v211 = 0;
    int v185 = 0;
    int v189 = 0;
    BOOL v210 = 0;
    int v188 = 0;
    int v192 = 0;
    BOOL v208 = 0;
    int v194 = 0;
    int v196 = 0;
    BOOL v206 = 0;
    int v197 = 0;
    int v200 = 0;
    int v202 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    char v16 = 0;
  }
  else
  {
    uint64_t v10 = [(SFCardSection *)self punchoutOptions];
    uint64_t v4 = v10 != 0;
    v173 = (void *)v10;
    if (!v10
      || ([(SFCardSection *)self punchoutOptions],
          unint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [(SFCardSection *)v7 punchoutOptions],
          v170 = v3,
          v169 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:")))
    {
      v172 = [(SFCardSection *)self punchoutPickerTitle];
      v171 = [(SFCardSection *)v7 punchoutPickerTitle];
      HIDWORD(v218) = v4;
      if ((v172 == 0) == (v171 != 0))
      {
        int v207 = 0;
        long long v226 = 0uLL;
        uint64_t v205 = 0;
        memset(v204, 0, sizeof(v204));
        LODWORD(v218) = 0;
        int v11 = 0;
        int v203 = 0;
        int v201 = 0;
        int v198 = 0;
        int v199 = 0;
        BOOL v225 = 0;
        int v193 = 0;
        int v195 = 0;
        BOOL v224 = 0;
        uint64_t v190 = 0;
        BOOL v223 = 0;
        int v187 = 0;
        int v191 = 0;
        BOOL v217 = 0;
        int v183 = 0;
        int v186 = 0;
        BOOL v216 = 0;
        int v178 = 0;
        int v184 = 0;
        BOOL v215 = 0;
        int v176 = 0;
        int v182 = 0;
        BOOL v214 = 0;
        int v174 = 0;
        int v180 = 0;
        BOOL v213 = 0;
        int v175 = 0;
        int v181 = 0;
        BOOL v212 = 0;
        int v177 = 0;
        int v179 = 0;
        BOOL v211 = 0;
        int v185 = 0;
        int v189 = 0;
        BOOL v210 = 0;
        int v188 = 0;
        int v192 = 0;
        BOOL v208 = 0;
        int v194 = 0;
        int v196 = 0;
        BOOL v206 = 0;
        int v197 = 0;
        int v200 = 0;
        int v202 = 0;
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
        int v15 = 0;
        char v16 = 0;
        int v209 = 1;
      }
      else
      {
        uint64_t v17 = [(SFCardSection *)self punchoutPickerTitle];
        HIDWORD(v226) = v17 != 0;
        v168 = (void *)v17;
        if (!v17
          || ([(SFCardSection *)self punchoutPickerTitle],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFCardSection *)v7 punchoutPickerTitle],
              v165 = v3,
              v164 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:")))
        {
          v167 = [(SFCardSection *)self punchoutPickerDismissText];
          v166 = [(SFCardSection *)v7 punchoutPickerDismissText];
          if ((v167 == 0) == (v166 != 0))
          {
            memset(v204, 0, sizeof(v204));
            *(void *)((char *)&v226 + 4) = 0;
            LODWORD(v218) = 0;
            int v11 = 0;
            int v203 = 0;
            int v201 = 0;
            LODWORD(v226) = 0;
            int v198 = 0;
            int v199 = 0;
            BOOL v225 = 0;
            int v193 = 0;
            int v195 = 0;
            BOOL v224 = 0;
            uint64_t v190 = 0;
            BOOL v223 = 0;
            int v187 = 0;
            int v191 = 0;
            BOOL v217 = 0;
            int v183 = 0;
            int v186 = 0;
            BOOL v216 = 0;
            int v178 = 0;
            int v184 = 0;
            BOOL v215 = 0;
            int v176 = 0;
            int v182 = 0;
            BOOL v214 = 0;
            int v174 = 0;
            int v180 = 0;
            BOOL v213 = 0;
            int v175 = 0;
            int v181 = 0;
            BOOL v212 = 0;
            int v177 = 0;
            int v179 = 0;
            BOOL v211 = 0;
            int v185 = 0;
            int v189 = 0;
            BOOL v210 = 0;
            int v188 = 0;
            int v192 = 0;
            BOOL v208 = 0;
            int v194 = 0;
            int v196 = 0;
            BOOL v206 = 0;
            int v197 = 0;
            int v200 = 0;
            int v202 = 0;
            int v12 = 0;
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            char v16 = 0;
            int v209 = 1;
            int v207 = 1;
            uint64_t v205 = 1;
          }
          else
          {
            uint64_t v24 = [(SFCardSection *)self punchoutPickerDismissText];
            DWORD2(v226) = v24 != 0;
            v163 = (void *)v24;
            if (!v24
              || ([(SFCardSection *)self punchoutPickerDismissText],
                  unint64_t v3 = objc_claimAutoreleasedReturnValue(),
                  [(SFCardSection *)v7 punchoutPickerDismissText],
                  v162 = v3,
                  v161 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v3, "isEqual:")))
            {
              BOOL v25 = [(SFCardSection *)self canBeHidden];
              if (v25 == [(SFCardSection *)v7 canBeHidden]
                && (BOOL v26 = [(SFCardSection *)self hasTopPadding],
                    v26 == [(SFCardSection *)v7 hasTopPadding])
                && (BOOL v27 = [(SFCardSection *)self hasBottomPadding],
                    v27 == [(SFCardSection *)v7 hasBottomPadding]))
              {
                v160 = [(SFDetailedRowCardSection *)self type];
                v159 = [(SFDetailedRowCardSection *)v7 type];
                if ((v160 == 0) != (v159 != 0))
                {
                  uint64_t v28 = [(SFDetailedRowCardSection *)self type];
                  BOOL v29 = v28 != 0;
                  v158 = (void *)v28;
                  if (v28)
                  {
                    unint64_t v3 = [(SFDetailedRowCardSection *)self type];
                    [(SFDetailedRowCardSection *)v7 type];
                    v156 = v157 = v3;
                    if (!objc_msgSend(v3, "isEqual:"))
                    {
                      int v11 = 0;
                      *(void *)&long long v226 = 0;
                      int v203 = 0;
                      int v201 = 0;
                      int v198 = 0;
                      int v199 = 0;
                      BOOL v225 = 0;
                      int v193 = 0;
                      int v195 = 0;
                      BOOL v224 = 0;
                      uint64_t v190 = 0;
                      BOOL v223 = 0;
                      int v187 = 0;
                      int v191 = 0;
                      BOOL v217 = 0;
                      int v183 = 0;
                      int v186 = 0;
                      BOOL v216 = 0;
                      int v178 = 0;
                      int v184 = 0;
                      BOOL v215 = 0;
                      int v176 = 0;
                      int v182 = 0;
                      BOOL v214 = 0;
                      int v174 = 0;
                      int v180 = 0;
                      BOOL v213 = 0;
                      int v175 = 0;
                      int v181 = 0;
                      BOOL v212 = 0;
                      int v177 = 0;
                      int v179 = 0;
                      BOOL v211 = 0;
                      int v185 = 0;
                      int v189 = 0;
                      BOOL v210 = 0;
                      int v188 = 0;
                      int v192 = 0;
                      BOOL v208 = 0;
                      int v194 = 0;
                      int v196 = 0;
                      BOOL v206 = 0;
                      int v197 = 0;
                      int v200 = 0;
                      int v202 = 0;
                      int v12 = 0;
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      char v16 = 0;
                      int v209 = 1;
                      int v207 = 1;
                      uint64_t v205 = 1;
                      *(void *)v204 = 1;
                      *(_DWORD *)&v204[16] = 0;
                      *(void *)&v204[8] = 0x100000001;
                      LODWORD(v218) = 1;
                      goto LABEL_16;
                    }
                    LODWORD(v218) = v29;
                  }
                  else
                  {
                    LODWORD(v218) = 0;
                  }
                  int v30 = [(SFCardSection *)self separatorStyle];
                  if (v30 == [(SFCardSection *)v7 separatorStyle])
                  {
                    v155 = [(SFCardSection *)self backgroundColor];
                    v154 = [(SFCardSection *)v7 backgroundColor];
                    if ((v155 == 0) == (v154 != 0))
                    {
                      *(_DWORD *)&v204[4] = 0;
                      *(void *)&long long v226 = 0;
                      int v203 = 0;
                      int v201 = 0;
                      int v198 = 0;
                      int v199 = 0;
                      BOOL v225 = 0;
                      int v193 = 0;
                      int v195 = 0;
                      BOOL v224 = 0;
                      uint64_t v190 = 0;
                      BOOL v223 = 0;
                      int v187 = 0;
                      int v191 = 0;
                      BOOL v217 = 0;
                      int v183 = 0;
                      int v186 = 0;
                      BOOL v216 = 0;
                      int v178 = 0;
                      int v184 = 0;
                      BOOL v215 = 0;
                      int v176 = 0;
                      int v182 = 0;
                      BOOL v214 = 0;
                      int v174 = 0;
                      int v180 = 0;
                      BOOL v213 = 0;
                      int v175 = 0;
                      int v181 = 0;
                      BOOL v212 = 0;
                      int v177 = 0;
                      int v179 = 0;
                      BOOL v211 = 0;
                      int v185 = 0;
                      int v189 = 0;
                      BOOL v210 = 0;
                      int v188 = 0;
                      int v192 = 0;
                      BOOL v208 = 0;
                      int v194 = 0;
                      int v196 = 0;
                      BOOL v206 = 0;
                      int v197 = 0;
                      int v200 = 0;
                      int v202 = 0;
                      int v12 = 0;
                      int v13 = 0;
                      int v14 = 0;
                      int v15 = 0;
                      char v16 = 0;
                      int v209 = 1;
                      int v207 = 1;
                      uint64_t v205 = 1;
                      *(_DWORD *)v204 = 1;
                      *(void *)&v204[12] = 1;
                      *(_DWORD *)&v204[8] = 1;
                      int v11 = 1;
                    }
                    else
                    {
                      uint64_t v31 = [(SFCardSection *)self backgroundColor];
                      DWORD1(v226) = v31 != 0;
                      v153 = (void *)v31;
                      if (!v31
                        || ([(SFCardSection *)self backgroundColor],
                            uint64_t v32 = objc_claimAutoreleasedReturnValue(),
                            [(SFCardSection *)v7 backgroundColor],
                            v150 = v32,
                            v149 = objc_claimAutoreleasedReturnValue(),
                            objc_msgSend(v32, "isEqual:")))
                      {
                        v152 = [(SFDetailedRowCardSection *)self thumbnail];
                        v151 = [(SFDetailedRowCardSection *)v7 thumbnail];
                        if ((v152 == 0) == (v151 != 0))
                        {
                          int v201 = 0;
                          LODWORD(v226) = 0;
                          int v198 = 0;
                          int v199 = 0;
                          BOOL v225 = 0;
                          int v193 = 0;
                          int v195 = 0;
                          BOOL v224 = 0;
                          uint64_t v190 = 0;
                          BOOL v223 = 0;
                          int v187 = 0;
                          int v191 = 0;
                          BOOL v217 = 0;
                          int v183 = 0;
                          int v186 = 0;
                          BOOL v216 = 0;
                          int v178 = 0;
                          int v184 = 0;
                          BOOL v215 = 0;
                          int v176 = 0;
                          int v182 = 0;
                          BOOL v214 = 0;
                          int v174 = 0;
                          int v180 = 0;
                          BOOL v213 = 0;
                          int v175 = 0;
                          int v181 = 0;
                          BOOL v212 = 0;
                          int v177 = 0;
                          int v179 = 0;
                          BOOL v211 = 0;
                          int v185 = 0;
                          int v189 = 0;
                          BOOL v210 = 0;
                          int v188 = 0;
                          int v192 = 0;
                          BOOL v208 = 0;
                          int v194 = 0;
                          int v196 = 0;
                          BOOL v206 = 0;
                          int v197 = 0;
                          int v200 = 0;
                          int v12 = 0;
                          int v13 = 0;
                          int v14 = 0;
                          int v15 = 0;
                          char v16 = 0;
                          int v209 = 1;
                          int v207 = 1;
                          uint64_t v205 = 1;
                          *(void *)v204 = 0x100000001;
                          *(_DWORD *)&v204[16] = 0;
                          *(void *)&v204[8] = 0x100000001;
                          int v11 = 1;
                          int v202 = 0;
                          int v203 = 1;
                        }
                        else
                        {
                          uint64_t v33 = [(SFDetailedRowCardSection *)self thumbnail];
                          LODWORD(v226) = v33 != 0;
                          v148 = (void *)v33;
                          if (!v33
                            || ([(SFDetailedRowCardSection *)self thumbnail],
                                uint64_t v34 = objc_claimAutoreleasedReturnValue(),
                                [(SFDetailedRowCardSection *)v7 thumbnail],
                                v147 = v34,
                                v146 = objc_claimAutoreleasedReturnValue(),
                                objc_msgSend(v34, "isEqual:")))
                          {
                            BOOL v35 = [(SFDetailedRowCardSection *)self preventThumbnailImageScaling];
                            if (v35 == [(SFDetailedRowCardSection *)v7 preventThumbnailImageScaling])
                            {
                              v145 = [(SFDetailedRowCardSection *)self title];
                              v144 = [(SFDetailedRowCardSection *)v7 title];
                              if ((v145 == 0) == (v144 != 0))
                              {
                                int v199 = 0;
                                BOOL v225 = 0;
                                int v193 = 0;
                                int v195 = 0;
                                BOOL v224 = 0;
                                uint64_t v190 = 0;
                                BOOL v223 = 0;
                                int v187 = 0;
                                int v191 = 0;
                                BOOL v217 = 0;
                                int v183 = 0;
                                int v186 = 0;
                                BOOL v216 = 0;
                                int v178 = 0;
                                int v184 = 0;
                                BOOL v215 = 0;
                                int v176 = 0;
                                int v182 = 0;
                                BOOL v214 = 0;
                                int v174 = 0;
                                int v180 = 0;
                                BOOL v213 = 0;
                                int v175 = 0;
                                int v181 = 0;
                                BOOL v212 = 0;
                                int v177 = 0;
                                int v179 = 0;
                                BOOL v211 = 0;
                                int v185 = 0;
                                int v189 = 0;
                                BOOL v210 = 0;
                                int v188 = 0;
                                int v192 = 0;
                                BOOL v208 = 0;
                                int v194 = 0;
                                int v196 = 0;
                                BOOL v206 = 0;
                                int v197 = 0;
                                int v200 = 0;
                                int v12 = 0;
                                int v13 = 0;
                                int v14 = 0;
                                int v15 = 0;
                                char v16 = 0;
                                int v209 = 1;
                                int v207 = 1;
                                uint64_t v205 = 1;
                                *(void *)v204 = 0x100000001;
                                *(_DWORD *)&v204[16] = 0;
                                *(void *)&v204[8] = 0x100000001;
                                int v11 = 1;
                                int v202 = 0;
                                int v203 = 1;
                                int v201 = 1;
                                int v198 = 1;
                              }
                              else
                              {
                                uint64_t v36 = [(SFDetailedRowCardSection *)self title];
                                BOOL v225 = v36 != 0;
                                v143 = (void *)v36;
                                if (!v36
                                  || ([(SFDetailedRowCardSection *)self title],
                                      v37 = objc_claimAutoreleasedReturnValue(),
                                      [(SFDetailedRowCardSection *)v7 title],
                                      v140 = v37,
                                      v139 = objc_claimAutoreleasedReturnValue(),
                                      objc_msgSend(v37, "isEqual:")))
                                {
                                  v142 = [(SFDetailedRowCardSection *)self secondaryTitle];
                                  v141 = [(SFDetailedRowCardSection *)v7 secondaryTitle];
                                  if ((v142 == 0) == (v141 != 0))
                                  {
                                    int v195 = 0;
                                    BOOL v224 = 0;
                                    uint64_t v190 = 0;
                                    BOOL v223 = 0;
                                    int v187 = 0;
                                    int v191 = 0;
                                    BOOL v217 = 0;
                                    int v183 = 0;
                                    int v186 = 0;
                                    BOOL v216 = 0;
                                    int v178 = 0;
                                    int v184 = 0;
                                    BOOL v215 = 0;
                                    int v176 = 0;
                                    int v182 = 0;
                                    BOOL v214 = 0;
                                    int v174 = 0;
                                    int v180 = 0;
                                    BOOL v213 = 0;
                                    int v175 = 0;
                                    int v181 = 0;
                                    BOOL v212 = 0;
                                    int v177 = 0;
                                    int v179 = 0;
                                    BOOL v211 = 0;
                                    int v185 = 0;
                                    int v189 = 0;
                                    BOOL v210 = 0;
                                    int v188 = 0;
                                    int v192 = 0;
                                    BOOL v208 = 0;
                                    int v194 = 0;
                                    int v196 = 0;
                                    BOOL v206 = 0;
                                    int v197 = 0;
                                    int v200 = 0;
                                    int v12 = 0;
                                    int v13 = 0;
                                    int v14 = 0;
                                    int v15 = 0;
                                    char v16 = 0;
                                    int v209 = 1;
                                    int v207 = 1;
                                    uint64_t v205 = 1;
                                    *(void *)v204 = 0x100000001;
                                    *(_DWORD *)&v204[16] = 0;
                                    *(void *)&v204[8] = 0x100000001;
                                    int v11 = 1;
                                    int v202 = 0;
                                    int v203 = 1;
                                    int v201 = 1;
                                    int v198 = 1;
                                    int v199 = 1;
                                    int v193 = 1;
                                  }
                                  else
                                  {
                                    uint64_t v38 = [(SFDetailedRowCardSection *)self secondaryTitle];
                                    BOOL v224 = v38 != 0;
                                    v138 = (void *)v38;
                                    if (!v38
                                      || ([(SFDetailedRowCardSection *)self secondaryTitle],
                                          v39 = objc_claimAutoreleasedReturnValue(),
                                          [(SFDetailedRowCardSection *)v7 secondaryTitle],
                                          v135 = v39,
                                          v134 = objc_claimAutoreleasedReturnValue(),
                                          objc_msgSend(v39, "isEqual:")))
                                    {
                                      v137 = [(SFDetailedRowCardSection *)self secondaryTitleImage];
                                      v136 = [(SFDetailedRowCardSection *)v7 secondaryTitleImage];
                                      if ((v137 == 0) == (v136 != 0))
                                      {
                                        uint64_t v190 = 0x100000000;
                                        BOOL v223 = 0;
                                        int v187 = 0;
                                        int v191 = 0;
                                        BOOL v217 = 0;
                                        int v183 = 0;
                                        int v186 = 0;
                                        BOOL v216 = 0;
                                        int v178 = 0;
                                        int v184 = 0;
                                        BOOL v215 = 0;
                                        int v176 = 0;
                                        int v182 = 0;
                                        BOOL v214 = 0;
                                        int v174 = 0;
                                        int v180 = 0;
                                        BOOL v213 = 0;
                                        int v175 = 0;
                                        int v181 = 0;
                                        BOOL v212 = 0;
                                        int v177 = 0;
                                        int v179 = 0;
                                        BOOL v211 = 0;
                                        int v185 = 0;
                                        int v189 = 0;
                                        BOOL v210 = 0;
                                        int v188 = 0;
                                        int v192 = 0;
                                        BOOL v208 = 0;
                                        int v194 = 0;
                                        int v196 = 0;
                                        BOOL v206 = 0;
                                        int v197 = 0;
                                        int v200 = 0;
                                        int v12 = 0;
                                        int v13 = 0;
                                        int v14 = 0;
                                        int v15 = 0;
                                        char v16 = 0;
                                        int v209 = 1;
                                        int v207 = 1;
                                        uint64_t v205 = 1;
                                        *(void *)v204 = 0x100000001;
                                        *(_DWORD *)&v204[16] = 0;
                                        *(void *)&v204[8] = 0x100000001;
                                        int v11 = 1;
                                        int v202 = 0;
                                        int v203 = 1;
                                        int v201 = 1;
                                        int v198 = 1;
                                        int v199 = 1;
                                        int v193 = 1;
                                        int v195 = 1;
                                      }
                                      else
                                      {
                                        uint64_t v40 = [(SFDetailedRowCardSection *)self secondaryTitleImage];
                                        BOOL v223 = v40 != 0;
                                        v133 = (void *)v40;
                                        if (!v40
                                          || (-[SFDetailedRowCardSection secondaryTitleImage](self, "secondaryTitleImage"), v41 = objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection secondaryTitleImage](v7, "secondaryTitleImage"), v131 = objc_claimAutoreleasedReturnValue(), v132 = v41, objc_msgSend(v41, "isEqual:")))
                                        {
                                          BOOL v42 = [(SFDetailedRowCardSection *)self isSecondaryTitleDetached];
                                          if (v42 == [(SFDetailedRowCardSection *)v7 isSecondaryTitleDetached])
                                          {
                                            v130 = [(SFDetailedRowCardSection *)self descriptions];
                                            v129 = [(SFDetailedRowCardSection *)v7 descriptions];
                                            if ((v130 == 0) == (v129 != 0))
                                            {
                                              int v191 = 0;
                                              BOOL v217 = 0;
                                              int v183 = 0;
                                              int v186 = 0;
                                              BOOL v216 = 0;
                                              int v178 = 0;
                                              int v184 = 0;
                                              BOOL v215 = 0;
                                              int v176 = 0;
                                              int v182 = 0;
                                              BOOL v214 = 0;
                                              int v174 = 0;
                                              int v180 = 0;
                                              BOOL v213 = 0;
                                              int v175 = 0;
                                              int v181 = 0;
                                              BOOL v212 = 0;
                                              int v177 = 0;
                                              int v179 = 0;
                                              BOOL v211 = 0;
                                              int v185 = 0;
                                              int v189 = 0;
                                              BOOL v210 = 0;
                                              int v188 = 0;
                                              int v192 = 0;
                                              BOOL v208 = 0;
                                              int v194 = 0;
                                              int v196 = 0;
                                              BOOL v206 = 0;
                                              int v197 = 0;
                                              int v200 = 0;
                                              int v12 = 0;
                                              int v13 = 0;
                                              int v14 = 0;
                                              int v15 = 0;
                                              char v16 = 0;
                                              int v209 = 1;
                                              int v207 = 1;
                                              uint64_t v205 = 1;
                                              *(void *)v204 = 0x100000001;
                                              *(_DWORD *)&v204[16] = 0;
                                              *(void *)&v204[8] = 0x100000001;
                                              int v11 = 1;
                                              int v202 = 0;
                                              int v203 = 1;
                                              int v201 = 1;
                                              int v198 = 1;
                                              int v199 = 1;
                                              int v193 = 1;
                                              int v195 = 1;
                                              uint64_t v190 = 0x100000001;
                                              int v187 = 1;
                                            }
                                            else
                                            {
                                              uint64_t v43 = [(SFDetailedRowCardSection *)self descriptions];
                                              BOOL v217 = v43 != 0;
                                              v128 = (void *)v43;
                                              if (!v43
                                                || ([(SFDetailedRowCardSection *)self descriptions],
                                                    v44 = objc_claimAutoreleasedReturnValue(),
                                                    [(SFDetailedRowCardSection *)v7 descriptions],
                                                    v124 = objc_claimAutoreleasedReturnValue(),
                                                    v125 = v44,
                                                    objc_msgSend(v44, "isEqual:")))
                                              {
                                                v127 = [(SFDetailedRowCardSection *)self footnote];
                                                v126 = [(SFDetailedRowCardSection *)v7 footnote];
                                                if ((v127 == 0) == (v126 != 0))
                                                {
                                                  int v186 = 0;
                                                  BOOL v216 = 0;
                                                  int v178 = 0;
                                                  int v184 = 0;
                                                  BOOL v215 = 0;
                                                  int v176 = 0;
                                                  int v182 = 0;
                                                  BOOL v214 = 0;
                                                  int v174 = 0;
                                                  int v180 = 0;
                                                  BOOL v213 = 0;
                                                  int v175 = 0;
                                                  int v181 = 0;
                                                  BOOL v212 = 0;
                                                  int v177 = 0;
                                                  int v179 = 0;
                                                  BOOL v211 = 0;
                                                  int v185 = 0;
                                                  int v189 = 0;
                                                  BOOL v210 = 0;
                                                  int v188 = 0;
                                                  int v192 = 0;
                                                  BOOL v208 = 0;
                                                  int v194 = 0;
                                                  int v196 = 0;
                                                  BOOL v206 = 0;
                                                  int v197 = 0;
                                                  int v200 = 0;
                                                  int v12 = 0;
                                                  int v13 = 0;
                                                  int v14 = 0;
                                                  int v15 = 0;
                                                  char v16 = 0;
                                                  int v209 = 1;
                                                  int v207 = 1;
                                                  uint64_t v205 = 1;
                                                  *(void *)v204 = 0x100000001;
                                                  *(_DWORD *)&v204[16] = 0;
                                                  *(void *)&v204[8] = 0x100000001;
                                                  int v11 = 1;
                                                  int v202 = 0;
                                                  int v203 = 1;
                                                  int v201 = 1;
                                                  int v198 = 1;
                                                  int v199 = 1;
                                                  int v193 = 1;
                                                  int v195 = 1;
                                                  uint64_t v190 = 0x100000001;
                                                  int v187 = 1;
                                                  int v191 = 1;
                                                  int v183 = 1;
                                                }
                                                else
                                                {
                                                  uint64_t v45 = [(SFDetailedRowCardSection *)self footnote];
                                                  BOOL v216 = v45 != 0;
                                                  v123 = (void *)v45;
                                                  if (!v45
                                                    || ([(SFDetailedRowCardSection *)self footnote],
                                                        v46 = objc_claimAutoreleasedReturnValue(),
                                                        [(SFDetailedRowCardSection *)v7 footnote],
                                                        v119 = objc_claimAutoreleasedReturnValue(),
                                                        v120 = v46,
                                                        objc_msgSend(v46, "isEqual:")))
                                                  {
                                                    v122 = [(SFDetailedRowCardSection *)self trailingTopText];
                                                    v121 = [(SFDetailedRowCardSection *)v7 trailingTopText];
                                                    if ((v122 == 0) == (v121 != 0))
                                                    {
                                                      int v184 = 0;
                                                      BOOL v215 = 0;
                                                      int v176 = 0;
                                                      int v182 = 0;
                                                      BOOL v214 = 0;
                                                      int v174 = 0;
                                                      int v180 = 0;
                                                      BOOL v213 = 0;
                                                      int v175 = 0;
                                                      int v181 = 0;
                                                      BOOL v212 = 0;
                                                      int v177 = 0;
                                                      int v179 = 0;
                                                      BOOL v211 = 0;
                                                      int v185 = 0;
                                                      int v189 = 0;
                                                      BOOL v210 = 0;
                                                      int v188 = 0;
                                                      int v192 = 0;
                                                      BOOL v208 = 0;
                                                      int v194 = 0;
                                                      int v196 = 0;
                                                      BOOL v206 = 0;
                                                      int v197 = 0;
                                                      int v200 = 0;
                                                      int v12 = 0;
                                                      int v13 = 0;
                                                      int v14 = 0;
                                                      int v15 = 0;
                                                      char v16 = 0;
                                                      int v209 = 1;
                                                      int v207 = 1;
                                                      uint64_t v205 = 1;
                                                      *(void *)v204 = 0x100000001;
                                                      *(_DWORD *)&v204[16] = 0;
                                                      *(void *)&v204[8] = 0x100000001;
                                                      int v11 = 1;
                                                      int v202 = 0;
                                                      int v203 = 1;
                                                      int v201 = 1;
                                                      int v198 = 1;
                                                      int v199 = 1;
                                                      int v193 = 1;
                                                      int v195 = 1;
                                                      uint64_t v190 = 0x100000001;
                                                      int v187 = 1;
                                                      int v191 = 1;
                                                      int v183 = 1;
                                                      int v186 = 1;
                                                      int v178 = 1;
                                                    }
                                                    else
                                                    {
                                                      uint64_t v47 = [(SFDetailedRowCardSection *)self trailingTopText];
                                                      BOOL v215 = v47 != 0;
                                                      v116 = (void *)v47;
                                                      if (!v47
                                                        || (-[SFDetailedRowCardSection trailingTopText](self, "trailingTopText"), v48 = objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection trailingTopText](v7, "trailingTopText"), v117 = objc_claimAutoreleasedReturnValue(), v118 = v48, objc_msgSend(v48, "isEqual:")))
                                                      {
                                                        v115 = [(SFDetailedRowCardSection *)self trailingMiddleText];
                                                        v114 = [(SFDetailedRowCardSection *)v7 trailingMiddleText];
                                                        if ((v115 == 0) == (v114 != 0))
                                                        {
                                                          int v182 = 0;
                                                          BOOL v214 = 0;
                                                          int v174 = 0;
                                                          int v180 = 0;
                                                          BOOL v213 = 0;
                                                          int v175 = 0;
                                                          int v181 = 0;
                                                          BOOL v212 = 0;
                                                          int v177 = 0;
                                                          int v179 = 0;
                                                          BOOL v211 = 0;
                                                          int v185 = 0;
                                                          int v189 = 0;
                                                          BOOL v210 = 0;
                                                          int v188 = 0;
                                                          int v192 = 0;
                                                          BOOL v208 = 0;
                                                          int v194 = 0;
                                                          int v196 = 0;
                                                          BOOL v206 = 0;
                                                          int v197 = 0;
                                                          int v200 = 0;
                                                          int v12 = 0;
                                                          int v13 = 0;
                                                          int v14 = 0;
                                                          int v15 = 0;
                                                          char v16 = 0;
                                                          int v209 = 1;
                                                          int v207 = 1;
                                                          uint64_t v205 = 1;
                                                          *(void *)v204 = 0x100000001;
                                                          *(_DWORD *)&v204[16] = 0;
                                                          *(void *)&v204[8] = 0x100000001;
                                                          int v11 = 1;
                                                          int v202 = 0;
                                                          int v203 = 1;
                                                          int v201 = 1;
                                                          int v198 = 1;
                                                          int v199 = 1;
                                                          int v193 = 1;
                                                          int v195 = 1;
                                                          uint64_t v190 = 0x100000001;
                                                          int v187 = 1;
                                                          int v191 = 1;
                                                          int v183 = 1;
                                                          int v186 = 1;
                                                          int v178 = 1;
                                                          int v184 = 1;
                                                          int v176 = 1;
                                                        }
                                                        else
                                                        {
                                                          uint64_t v49 = [(SFDetailedRowCardSection *)self trailingMiddleText];
                                                          BOOL v214 = v49 != 0;
                                                          v109 = (void *)v49;
                                                          if (!v49
                                                            || (-[SFDetailedRowCardSection trailingMiddleText](self, "trailingMiddleText"), v50 = objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection trailingMiddleText](v7, "trailingMiddleText"), v112 = objc_claimAutoreleasedReturnValue(), v113 = v50, objc_msgSend(v50, "isEqual:")))
                                                          {
                                                            v108 = [(SFDetailedRowCardSection *)self trailingBottomText];
                                                            v105 = [(SFDetailedRowCardSection *)v7 trailingBottomText];
                                                            if ((v108 == 0) == (v105 != 0))
                                                            {
                                                              int v180 = 0;
                                                              BOOL v213 = 0;
                                                              int v175 = 0;
                                                              int v181 = 0;
                                                              BOOL v212 = 0;
                                                              int v177 = 0;
                                                              int v179 = 0;
                                                              BOOL v211 = 0;
                                                              int v185 = 0;
                                                              int v189 = 0;
                                                              BOOL v210 = 0;
                                                              int v188 = 0;
                                                              int v192 = 0;
                                                              BOOL v208 = 0;
                                                              int v194 = 0;
                                                              int v196 = 0;
                                                              BOOL v206 = 0;
                                                              int v197 = 0;
                                                              int v200 = 0;
                                                              int v12 = 0;
                                                              int v13 = 0;
                                                              int v14 = 0;
                                                              int v15 = 0;
                                                              char v16 = 0;
                                                              int v209 = 1;
                                                              int v207 = 1;
                                                              uint64_t v205 = 1;
                                                              *(void *)v204 = 0x100000001;
                                                              *(_DWORD *)&v204[16] = 0;
                                                              *(void *)&v204[8] = 0x100000001;
                                                              int v11 = 1;
                                                              int v202 = 0;
                                                              int v203 = 1;
                                                              int v201 = 1;
                                                              int v198 = 1;
                                                              int v199 = 1;
                                                              int v193 = 1;
                                                              int v195 = 1;
                                                              uint64_t v190 = 0x100000001;
                                                              int v187 = 1;
                                                              int v191 = 1;
                                                              int v183 = 1;
                                                              int v186 = 1;
                                                              int v178 = 1;
                                                              int v184 = 1;
                                                              int v176 = 1;
                                                              int v182 = 1;
                                                              int v174 = 1;
                                                            }
                                                            else
                                                            {
                                                              uint64_t v51 = [(SFDetailedRowCardSection *)self trailingBottomText];
                                                              BOOL v213 = v51 != 0;
                                                              v104 = (void *)v51;
                                                              if (!v51
                                                                || (-[SFDetailedRowCardSection trailingBottomText](self, "trailingBottomText"), v52 = objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection trailingBottomText](v7, "trailingBottomText"), v110 = objc_claimAutoreleasedReturnValue(), v111 = v52, objc_msgSend(v52, "isEqual:")))
                                                              {
                                                                v103 = [(SFDetailedRowCardSection *)self action];
                                                                v100 = [(SFDetailedRowCardSection *)v7 action];
                                                                if ((v103 == 0) == (v100 != 0))
                                                                {
                                                                  int v181 = 0;
                                                                  BOOL v212 = 0;
                                                                  int v177 = 0;
                                                                  int v179 = 0;
                                                                  BOOL v211 = 0;
                                                                  int v185 = 0;
                                                                  int v189 = 0;
                                                                  BOOL v210 = 0;
                                                                  int v188 = 0;
                                                                  int v192 = 0;
                                                                  BOOL v208 = 0;
                                                                  int v194 = 0;
                                                                  int v196 = 0;
                                                                  BOOL v206 = 0;
                                                                  int v197 = 0;
                                                                  int v200 = 0;
                                                                  int v12 = 0;
                                                                  int v13 = 0;
                                                                  int v14 = 0;
                                                                  int v15 = 0;
                                                                  char v16 = 0;
                                                                  int v209 = 1;
                                                                  int v207 = 1;
                                                                  uint64_t v205 = 1;
                                                                  *(void *)v204 = 0x100000001;
                                                                  *(_DWORD *)&v204[16] = 0;
                                                                  *(void *)&v204[8] = 0x100000001;
                                                                  int v11 = 1;
                                                                  int v202 = 0;
                                                                  int v203 = 1;
                                                                  int v201 = 1;
                                                                  int v198 = 1;
                                                                  int v199 = 1;
                                                                  int v193 = 1;
                                                                  int v195 = 1;
                                                                  uint64_t v190 = 0x100000001;
                                                                  int v187 = 1;
                                                                  int v191 = 1;
                                                                  int v183 = 1;
                                                                  int v186 = 1;
                                                                  int v178 = 1;
                                                                  int v184 = 1;
                                                                  int v176 = 1;
                                                                  int v182 = 1;
                                                                  int v174 = 1;
                                                                  int v180 = 1;
                                                                  int v175 = 1;
                                                                }
                                                                else
                                                                {
                                                                  uint64_t v53 = [(SFDetailedRowCardSection *)self action];
                                                                  BOOL v212 = v53 != 0;
                                                                  v99 = (void *)v53;
                                                                  if (!v53
                                                                    || (-[SFDetailedRowCardSection action](self, "action"), v54 = objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection action](v7, "action"), v106 = objc_claimAutoreleasedReturnValue(), v107 = v54, objc_msgSend(v54, "isEqual:")))
                                                                  {
                                                                    v98 = [(SFDetailedRowCardSection *)self button];
                                                                    v97 = [(SFDetailedRowCardSection *)v7 button];
                                                                    if ((v98 == 0) == (v97 != 0))
                                                                    {
                                                                      int v179 = 0;
                                                                      BOOL v211 = 0;
                                                                      int v185 = 0;
                                                                      int v189 = 0;
                                                                      BOOL v210 = 0;
                                                                      int v188 = 0;
                                                                      int v192 = 0;
                                                                      BOOL v208 = 0;
                                                                      int v194 = 0;
                                                                      int v196 = 0;
                                                                      BOOL v206 = 0;
                                                                      int v197 = 0;
                                                                      int v200 = 0;
                                                                      int v12 = 0;
                                                                      int v13 = 0;
                                                                      int v14 = 0;
                                                                      int v15 = 0;
                                                                      char v16 = 0;
                                                                      int v209 = 1;
                                                                      int v207 = 1;
                                                                      uint64_t v205 = 1;
                                                                      *(void *)v204 = 0x100000001;
                                                                      *(_DWORD *)&v204[16] = 0;
                                                                      *(void *)&v204[8] = 0x100000001;
                                                                      int v11 = 1;
                                                                      int v202 = 0;
                                                                      int v203 = 1;
                                                                      int v201 = 1;
                                                                      int v198 = 1;
                                                                      int v199 = 1;
                                                                      int v193 = 1;
                                                                      int v195 = 1;
                                                                      uint64_t v190 = 0x100000001;
                                                                      int v187 = 1;
                                                                      int v191 = 1;
                                                                      int v183 = 1;
                                                                      int v186 = 1;
                                                                      int v178 = 1;
                                                                      int v184 = 1;
                                                                      int v176 = 1;
                                                                      int v182 = 1;
                                                                      int v174 = 1;
                                                                      int v180 = 1;
                                                                      int v175 = 1;
                                                                      int v181 = 1;
                                                                      int v177 = 1;
                                                                    }
                                                                    else
                                                                    {
                                                                      uint64_t v55 = [(SFDetailedRowCardSection *)self button];
                                                                      BOOL v211 = v55 != 0;
                                                                      v94 = (void *)v55;
                                                                      if (!v55
                                                                        || (-[SFDetailedRowCardSection button](self, "button"), v56 = objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection button](v7, "button"), v101 = objc_claimAutoreleasedReturnValue(), v102 = v56, objc_msgSend(v56, "isEqual:")))
                                                                      {
                                                                        BOOL v57 = [(SFDetailedRowCardSection *)self shouldUseCompactDisplay];
                                                                        if (v57 == [(SFDetailedRowCardSection *)v7 shouldUseCompactDisplay])
                                                                        {
                                                                          v93 = [(SFDetailedRowCardSection *)self buttonItems];
                                                                          v91 = [(SFDetailedRowCardSection *)v7 buttonItems];
                                                                          if ((v93 == 0) == (v91 != 0))
                                                                          {
                                                                            int v189 = 0;
                                                                            BOOL v210 = 0;
                                                                            int v188 = 0;
                                                                            int v192 = 0;
                                                                            BOOL v208 = 0;
                                                                            int v194 = 0;
                                                                            int v196 = 0;
                                                                            BOOL v206 = 0;
                                                                            int v197 = 0;
                                                                            int v200 = 0;
                                                                            int v12 = 0;
                                                                            int v13 = 0;
                                                                            int v14 = 0;
                                                                            int v15 = 0;
                                                                            char v16 = 0;
                                                                            int v209 = 1;
                                                                            int v207 = 1;
                                                                            uint64_t v205 = 1;
                                                                            *(void *)v204 = 0x100000001;
                                                                            *(_DWORD *)&v204[16] = 0;
                                                                            *(void *)&v204[8] = 0x100000001;
                                                                            int v11 = 1;
                                                                            int v202 = 0;
                                                                            int v203 = 1;
                                                                            int v201 = 1;
                                                                            int v198 = 1;
                                                                            int v199 = 1;
                                                                            int v193 = 1;
                                                                            int v195 = 1;
                                                                            uint64_t v190 = 0x100000001;
                                                                            int v187 = 1;
                                                                            int v191 = 1;
                                                                            int v183 = 1;
                                                                            int v186 = 1;
                                                                            int v178 = 1;
                                                                            int v184 = 1;
                                                                            int v176 = 1;
                                                                            int v182 = 1;
                                                                            int v174 = 1;
                                                                            int v180 = 1;
                                                                            int v175 = 1;
                                                                            int v181 = 1;
                                                                            int v177 = 1;
                                                                            int v179 = 1;
                                                                            int v185 = 1;
                                                                          }
                                                                          else
                                                                          {
                                                                            uint64_t v58 = [(SFDetailedRowCardSection *)self buttonItems];
                                                                            BOOL v210 = v58 != 0;
                                                                            v89 = (void *)v58;
                                                                            if (!v58
                                                                              || (-[SFDetailedRowCardSection buttonItems](self, "buttonItems"), v59 = objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection buttonItems](v7, "buttonItems"), v95 = objc_claimAutoreleasedReturnValue(), v96 = v59, objc_msgSend(v59, "isEqual:")))
                                                                            {
                                                                              v88 = [(SFDetailedRowCardSection *)self trailingThumbnail];
                                                                              v87 = [(SFDetailedRowCardSection *)v7 trailingThumbnail];
                                                                              if ((v88 == 0) == (v87 != 0))
                                                                              {
                                                                                int v192 = 0;
                                                                                BOOL v208 = 0;
                                                                                int v194 = 0;
                                                                                int v196 = 0;
                                                                                BOOL v206 = 0;
                                                                                int v197 = 0;
                                                                                int v200 = 0;
                                                                                int v12 = 0;
                                                                                int v13 = 0;
                                                                                int v14 = 0;
                                                                                int v15 = 0;
                                                                                char v16 = 0;
                                                                                int v209 = 1;
                                                                                int v207 = 1;
                                                                                uint64_t v205 = 1;
                                                                                *(void *)v204 = 0x100000001;
                                                                                *(_DWORD *)&v204[16] = 0;
                                                                                *(void *)&v204[8] = 0x100000001;
                                                                                int v11 = 1;
                                                                                int v202 = 0;
                                                                                int v203 = 1;
                                                                                int v201 = 1;
                                                                                int v198 = 1;
                                                                                int v199 = 1;
                                                                                int v193 = 1;
                                                                                int v195 = 1;
                                                                                uint64_t v190 = 0x100000001;
                                                                                int v187 = 1;
                                                                                int v191 = 1;
                                                                                int v183 = 1;
                                                                                int v186 = 1;
                                                                                int v178 = 1;
                                                                                int v184 = 1;
                                                                                int v176 = 1;
                                                                                int v182 = 1;
                                                                                int v174 = 1;
                                                                                int v180 = 1;
                                                                                int v175 = 1;
                                                                                int v181 = 1;
                                                                                int v177 = 1;
                                                                                int v179 = 1;
                                                                                int v185 = 1;
                                                                                int v189 = 1;
                                                                                int v188 = 1;
                                                                              }
                                                                              else
                                                                              {
                                                                                uint64_t v60 = [(SFDetailedRowCardSection *)self trailingThumbnail];
                                                                                BOOL v208 = v60 != 0;
                                                                                v85 = (void *)v60;
                                                                                if (!v60
                                                                                  || (-[SFDetailedRowCardSection trailingThumbnail](self, "trailingThumbnail"), v61 = objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection trailingThumbnail](v7, "trailingThumbnail"), v92 = v61, v90 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v61, "isEqual:")))
                                                                                {
                                                                                  BOOL v62 = [(SFDetailedRowCardSection *)self buttonItemsAreTrailing];
                                                                                  if (v62 == [(SFDetailedRowCardSection *)v7 buttonItemsAreTrailing])
                                                                                  {
                                                                                    v83 = [(SFDetailedRowCardSection *)self topText];
                                                                                    v82 = [(SFDetailedRowCardSection *)v7 topText];
                                                                                    if ((v83 == 0) == (v82 != 0))
                                                                                    {
                                                                                      int v196 = 0;
                                                                                      BOOL v206 = 0;
                                                                                      int v197 = 0;
                                                                                      int v200 = 0;
                                                                                      int v12 = 0;
                                                                                      int v13 = 0;
                                                                                      int v14 = 0;
                                                                                      int v15 = 0;
                                                                                      char v16 = 0;
                                                                                      int v209 = 1;
                                                                                      int v207 = 1;
                                                                                      uint64_t v205 = 1;
                                                                                      *(void *)v204 = 0x100000001;
                                                                                      *(_DWORD *)&v204[16] = 0;
                                                                                      *(void *)&v204[8] = 0x100000001;
                                                                                      int v11 = 1;
                                                                                      int v202 = 0;
                                                                                      int v203 = 1;
                                                                                      int v201 = 1;
                                                                                      int v198 = 1;
                                                                                      int v199 = 1;
                                                                                      int v193 = 1;
                                                                                      int v195 = 1;
                                                                                      uint64_t v190 = 0x100000001;
                                                                                      int v187 = 1;
                                                                                      int v191 = 1;
                                                                                      int v183 = 1;
                                                                                      int v186 = 1;
                                                                                      int v178 = 1;
                                                                                      int v184 = 1;
                                                                                      int v176 = 1;
                                                                                      int v182 = 1;
                                                                                      int v174 = 1;
                                                                                      int v180 = 1;
                                                                                      int v175 = 1;
                                                                                      int v181 = 1;
                                                                                      int v177 = 1;
                                                                                      int v179 = 1;
                                                                                      int v185 = 1;
                                                                                      int v189 = 1;
                                                                                      int v188 = 1;
                                                                                      int v192 = 1;
                                                                                      int v194 = 1;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      uint64_t v63 = [(SFDetailedRowCardSection *)self topText];
                                                                                      BOOL v206 = v63 != 0;
                                                                                      v80 = (void *)v63;
                                                                                      if (!v63
                                                                                        || (-[SFDetailedRowCardSection topText](self, "topText"), v64 = objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection topText](v7, "topText"), v86 = v64, v84 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v64, "isEqual:")))
                                                                                      {
                                                                                        v78 = [(SFDetailedRowCardSection *)self richTrailingTopText];
                                                                                        v77 = [(SFDetailedRowCardSection *)v7 richTrailingTopText];
                                                                                        if ((v78 == 0) == (v77 != 0))
                                                                                        {
                                                                                          int v200 = 0;
                                                                                          int v12 = 0;
                                                                                          int v13 = 0;
                                                                                          int v14 = 0;
                                                                                          int v15 = 0;
                                                                                          char v16 = 0;
                                                                                          int v209 = 1;
                                                                                          int v207 = 1;
                                                                                          uint64_t v205 = 1;
                                                                                          *(void *)v204 = 0x100000001;
                                                                                          *(_DWORD *)&v204[16] = 0;
                                                                                          *(void *)&v204[8] = 0x100000001;
                                                                                          int v11 = 1;
                                                                                          int v202 = 0;
                                                                                          int v203 = 1;
                                                                                          int v201 = 1;
                                                                                          int v198 = 1;
                                                                                          int v199 = 1;
                                                                                          int v193 = 1;
                                                                                          int v195 = 1;
                                                                                          uint64_t v190 = 0x100000001;
                                                                                          int v187 = 1;
                                                                                          int v191 = 1;
                                                                                          int v183 = 1;
                                                                                          int v186 = 1;
                                                                                          int v178 = 1;
                                                                                          int v184 = 1;
                                                                                          int v176 = 1;
                                                                                          int v182 = 1;
                                                                                          int v174 = 1;
                                                                                          int v180 = 1;
                                                                                          int v175 = 1;
                                                                                          int v181 = 1;
                                                                                          int v177 = 1;
                                                                                          int v179 = 1;
                                                                                          int v185 = 1;
                                                                                          int v189 = 1;
                                                                                          int v188 = 1;
                                                                                          int v192 = 1;
                                                                                          int v194 = 1;
                                                                                          int v196 = 1;
                                                                                          int v197 = 1;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          uint64_t v65 = [(SFDetailedRowCardSection *)self richTrailingTopText];
                                                                                          HIDWORD(v205) = v65 != 0;
                                                                                          v76 = (void *)v65;
                                                                                          if (!v65
                                                                                            || (-[SFDetailedRowCardSection richTrailingTopText](self, "richTrailingTopText"), v66 = objc_claimAutoreleasedReturnValue(), -[SFDetailedRowCardSection richTrailingTopText](v7, "richTrailingTopText"), v81 = v66, v79 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v66, "isEqual:")))
                                                                                          {
                                                                                            v73 = [(SFDetailedRowCardSection *)self richTrailingMiddleText];
                                                                                            v72 = [(SFDetailedRowCardSection *)v7 richTrailingMiddleText];
                                                                                            if ((v73 == 0) == (v72 != 0))
                                                                                            {
                                                                                              int v12 = 0;
                                                                                              int v13 = 0;
                                                                                              int v14 = 0;
                                                                                              int v15 = 0;
                                                                                              char v16 = 0;
                                                                                              int v209 = 1;
                                                                                              int v207 = 1;
                                                                                              *(_DWORD *)&v204[16] = 0;
                                                                                              LODWORD(v205) = 1;
                                                                                              *(_DWORD *)v204 = 1;
                                                                                              *(_DWORD *)&v204[4] = 1;
                                                                                              *(_DWORD *)&v204[8] = 1;
                                                                                              *(_DWORD *)&v204[12] = 1;
                                                                                              int v11 = 1;
                                                                                              int v203 = 1;
                                                                                              int v201 = 1;
                                                                                              int v198 = 1;
                                                                                              int v199 = 1;
                                                                                              int v193 = 1;
                                                                                              int v195 = 1;
                                                                                              uint64_t v190 = 0x100000001;
                                                                                              int v187 = 1;
                                                                                              int v191 = 1;
                                                                                              int v183 = 1;
                                                                                              int v186 = 1;
                                                                                              int v178 = 1;
                                                                                              int v184 = 1;
                                                                                              int v176 = 1;
                                                                                              int v182 = 1;
                                                                                              int v174 = 1;
                                                                                              int v180 = 1;
                                                                                              int v175 = 1;
                                                                                              int v181 = 1;
                                                                                              int v177 = 1;
                                                                                              int v179 = 1;
                                                                                              int v185 = 1;
                                                                                              int v189 = 1;
                                                                                              int v188 = 1;
                                                                                              int v192 = 1;
                                                                                              int v194 = 1;
                                                                                              int v196 = 1;
                                                                                              int v197 = 1;
                                                                                              int v200 = 1;
                                                                                              int v202 = 1;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              uint64_t v67 = [(SFDetailedRowCardSection *)self richTrailingMiddleText];
                                                                                              *(_DWORD *)&v204[16] = v67 != 0;
                                                                                              v71 = (void *)v67;
                                                                                              if (!v67
                                                                                                || ([(SFDetailedRowCardSection *)self richTrailingMiddleText],
                                                                                                    v68 = objc_claimAutoreleasedReturnValue(),
                                                                                                    [(SFDetailedRowCardSection *)v7 richTrailingMiddleText],
                                                                                                    v74 = objc_claimAutoreleasedReturnValue(),
                                                                                                    v75 = v68,
                                                                                                    objc_msgSend(v68, "isEqual:")))
                                                                                              {
                                                                                                v69 = [(SFDetailedRowCardSection *)self richTrailingBottomText];
                                                                                                unint64_t v3 = [(SFDetailedRowCardSection *)v7 richTrailingBottomText];
                                                                                                if ((v69 == 0) == (v3 != 0))
                                                                                                {
                                                                                                  int v14 = 0;
                                                                                                  int v15 = 0;
                                                                                                  char v16 = 0;
                                                                                                  int v209 = 1;
                                                                                                  int v207 = 1;
                                                                                                  LODWORD(v205) = 1;
                                                                                                  *(_DWORD *)v204 = 1;
                                                                                                  *(_DWORD *)&v204[4] = 1;
                                                                                                  *(_DWORD *)&v204[8] = 1;
                                                                                                  *(_DWORD *)&v204[12] = 1;
                                                                                                  int v11 = 1;
                                                                                                  int v203 = 1;
                                                                                                  int v201 = 1;
                                                                                                  int v198 = 1;
                                                                                                  int v199 = 1;
                                                                                                  int v193 = 1;
                                                                                                  int v195 = 1;
                                                                                                  uint64_t v190 = 0x100000001;
                                                                                                  int v187 = 1;
                                                                                                  int v191 = 1;
                                                                                                  int v183 = 1;
                                                                                                  int v186 = 1;
                                                                                                  int v178 = 1;
                                                                                                  int v184 = 1;
                                                                                                  int v176 = 1;
                                                                                                  int v182 = 1;
                                                                                                  int v174 = 1;
                                                                                                  int v180 = 1;
                                                                                                  int v175 = 1;
                                                                                                  int v181 = 1;
                                                                                                  int v177 = 1;
                                                                                                  int v179 = 1;
                                                                                                  int v185 = 1;
                                                                                                  int v189 = 1;
                                                                                                  int v188 = 1;
                                                                                                  int v192 = 1;
                                                                                                  int v194 = 1;
                                                                                                  int v196 = 1;
                                                                                                  int v197 = 1;
                                                                                                  int v200 = 1;
                                                                                                  int v202 = 1;
                                                                                                  int v12 = 1;
                                                                                                  int v13 = 1;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v70 = [(SFDetailedRowCardSection *)self richTrailingBottomText];
                                                                                                  if (v70)
                                                                                                  {
                                                                                                    uint64_t v4 = [(SFDetailedRowCardSection *)self richTrailingBottomText];
                                                                                                    uint64_t v9 = [(SFDetailedRowCardSection *)v7 richTrailingBottomText];
                                                                                                    char v16 = [(id)v4 isEqual:v9];
                                                                                                    int v15 = 1;
                                                                                                    int v209 = 1;
                                                                                                    int v207 = 1;
                                                                                                    LODWORD(v205) = 1;
                                                                                                    *(_DWORD *)v204 = 1;
                                                                                                    *(_DWORD *)&v204[4] = 1;
                                                                                                    *(_DWORD *)&v204[8] = 1;
                                                                                                    *(_DWORD *)&v204[12] = 1;
                                                                                                    int v11 = 1;
                                                                                                    int v203 = 1;
                                                                                                    int v201 = 1;
                                                                                                    int v198 = 1;
                                                                                                    int v199 = 1;
                                                                                                    int v193 = 1;
                                                                                                    int v195 = 1;
                                                                                                    uint64_t v190 = 0x100000001;
                                                                                                    int v187 = 1;
                                                                                                    int v191 = 1;
                                                                                                    int v183 = 1;
                                                                                                    int v186 = 1;
                                                                                                    int v178 = 1;
                                                                                                    int v184 = 1;
                                                                                                    int v176 = 1;
                                                                                                    int v182 = 1;
                                                                                                    int v174 = 1;
                                                                                                    int v180 = 1;
                                                                                                    int v175 = 1;
                                                                                                    int v181 = 1;
                                                                                                    int v177 = 1;
                                                                                                    int v179 = 1;
                                                                                                    int v185 = 1;
                                                                                                    int v189 = 1;
                                                                                                    int v188 = 1;
                                                                                                    int v192 = 1;
                                                                                                    int v194 = 1;
                                                                                                    int v196 = 1;
                                                                                                    int v197 = 1;
                                                                                                    int v200 = 1;
                                                                                                    int v202 = 1;
                                                                                                    int v12 = 1;
                                                                                                    int v13 = 1;
                                                                                                    int v14 = 1;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v70 = 0;
                                                                                                    int v15 = 0;
                                                                                                    int v209 = 1;
                                                                                                    int v207 = 1;
                                                                                                    LODWORD(v205) = 1;
                                                                                                    *(void *)v204 = 0x100000001;
                                                                                                    *(void *)&v204[8] = 0x100000001;
                                                                                                    int v11 = 1;
                                                                                                    int v203 = 1;
                                                                                                    int v201 = 1;
                                                                                                    int v198 = 1;
                                                                                                    int v199 = 1;
                                                                                                    int v193 = 1;
                                                                                                    int v195 = 1;
                                                                                                    uint64_t v190 = 0x100000001;
                                                                                                    int v187 = 1;
                                                                                                    int v191 = 1;
                                                                                                    int v183 = 1;
                                                                                                    int v186 = 1;
                                                                                                    int v178 = 1;
                                                                                                    int v184 = 1;
                                                                                                    int v176 = 1;
                                                                                                    int v182 = 1;
                                                                                                    int v174 = 1;
                                                                                                    int v180 = 1;
                                                                                                    int v175 = 1;
                                                                                                    int v181 = 1;
                                                                                                    int v177 = 1;
                                                                                                    int v179 = 1;
                                                                                                    int v185 = 1;
                                                                                                    int v189 = 1;
                                                                                                    int v188 = 1;
                                                                                                    int v192 = 1;
                                                                                                    int v194 = 1;
                                                                                                    int v196 = 1;
                                                                                                    int v197 = 1;
                                                                                                    int v200 = 1;
                                                                                                    int v202 = 1;
                                                                                                    int v12 = 1;
                                                                                                    int v13 = 1;
                                                                                                    int v14 = 1;
                                                                                                    char v16 = 1;
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                int v13 = 0;
                                                                                                int v14 = 0;
                                                                                                int v15 = 0;
                                                                                                char v16 = 0;
                                                                                                int v209 = 1;
                                                                                                int v207 = 1;
                                                                                                LODWORD(v205) = 1;
                                                                                                *(_DWORD *)v204 = 1;
                                                                                                *(_DWORD *)&v204[4] = 1;
                                                                                                *(_DWORD *)&v204[8] = 1;
                                                                                                *(_DWORD *)&v204[12] = 1;
                                                                                                int v11 = 1;
                                                                                                int v203 = 1;
                                                                                                int v201 = 1;
                                                                                                int v198 = 1;
                                                                                                int v199 = 1;
                                                                                                int v193 = 1;
                                                                                                int v195 = 1;
                                                                                                uint64_t v190 = 0x100000001;
                                                                                                int v187 = 1;
                                                                                                int v191 = 1;
                                                                                                int v183 = 1;
                                                                                                int v186 = 1;
                                                                                                int v178 = 1;
                                                                                                int v184 = 1;
                                                                                                int v176 = 1;
                                                                                                int v182 = 1;
                                                                                                int v174 = 1;
                                                                                                int v180 = 1;
                                                                                                int v175 = 1;
                                                                                                int v181 = 1;
                                                                                                int v177 = 1;
                                                                                                int v179 = 1;
                                                                                                int v185 = 1;
                                                                                                int v189 = 1;
                                                                                                int v188 = 1;
                                                                                                int v192 = 1;
                                                                                                int v194 = 1;
                                                                                                int v196 = 1;
                                                                                                int v197 = 1;
                                                                                                int v200 = 1;
                                                                                                int v202 = 1;
                                                                                                int v12 = 1;
                                                                                                *(_DWORD *)&v204[16] = 1;
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            int v12 = 0;
                                                                                            int v13 = 0;
                                                                                            int v14 = 0;
                                                                                            int v15 = 0;
                                                                                            char v16 = 0;
                                                                                            int v209 = 1;
                                                                                            int v207 = 1;
                                                                                            *(_DWORD *)&v204[16] = 0;
                                                                                            uint64_t v205 = 0x100000001;
                                                                                            *(void *)v204 = 0x100000001;
                                                                                            *(void *)&v204[8] = 0x100000001;
                                                                                            int v11 = 1;
                                                                                            int v202 = 0;
                                                                                            int v203 = 1;
                                                                                            int v201 = 1;
                                                                                            int v198 = 1;
                                                                                            int v199 = 1;
                                                                                            int v193 = 1;
                                                                                            int v195 = 1;
                                                                                            uint64_t v190 = 0x100000001;
                                                                                            int v187 = 1;
                                                                                            int v191 = 1;
                                                                                            int v183 = 1;
                                                                                            int v186 = 1;
                                                                                            int v178 = 1;
                                                                                            int v184 = 1;
                                                                                            int v176 = 1;
                                                                                            int v182 = 1;
                                                                                            int v174 = 1;
                                                                                            int v180 = 1;
                                                                                            int v175 = 1;
                                                                                            int v181 = 1;
                                                                                            int v177 = 1;
                                                                                            int v179 = 1;
                                                                                            int v185 = 1;
                                                                                            int v189 = 1;
                                                                                            int v188 = 1;
                                                                                            int v192 = 1;
                                                                                            int v194 = 1;
                                                                                            int v196 = 1;
                                                                                            int v197 = 1;
                                                                                            int v200 = 1;
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        int v197 = 0;
                                                                                        int v200 = 0;
                                                                                        int v12 = 0;
                                                                                        int v13 = 0;
                                                                                        int v14 = 0;
                                                                                        int v15 = 0;
                                                                                        char v16 = 0;
                                                                                        int v209 = 1;
                                                                                        int v207 = 1;
                                                                                        uint64_t v205 = 1;
                                                                                        *(void *)v204 = 0x100000001;
                                                                                        *(_DWORD *)&v204[16] = 0;
                                                                                        *(void *)&v204[8] = 0x100000001;
                                                                                        int v11 = 1;
                                                                                        int v202 = 0;
                                                                                        int v203 = 1;
                                                                                        int v201 = 1;
                                                                                        int v198 = 1;
                                                                                        int v199 = 1;
                                                                                        int v193 = 1;
                                                                                        int v195 = 1;
                                                                                        uint64_t v190 = 0x100000001;
                                                                                        int v187 = 1;
                                                                                        int v191 = 1;
                                                                                        int v183 = 1;
                                                                                        int v186 = 1;
                                                                                        int v178 = 1;
                                                                                        int v184 = 1;
                                                                                        int v176 = 1;
                                                                                        int v182 = 1;
                                                                                        int v174 = 1;
                                                                                        int v180 = 1;
                                                                                        int v175 = 1;
                                                                                        int v181 = 1;
                                                                                        int v177 = 1;
                                                                                        int v179 = 1;
                                                                                        int v185 = 1;
                                                                                        int v189 = 1;
                                                                                        int v188 = 1;
                                                                                        int v192 = 1;
                                                                                        int v194 = 1;
                                                                                        int v196 = 1;
                                                                                        BOOL v206 = 1;
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    int v194 = 0;
                                                                                    int v196 = 0;
                                                                                    BOOL v206 = 0;
                                                                                    int v197 = 0;
                                                                                    int v200 = 0;
                                                                                    int v12 = 0;
                                                                                    int v13 = 0;
                                                                                    int v14 = 0;
                                                                                    int v15 = 0;
                                                                                    char v16 = 0;
                                                                                    int v209 = 1;
                                                                                    int v207 = 1;
                                                                                    uint64_t v205 = 1;
                                                                                    *(void *)v204 = 0x100000001;
                                                                                    *(_DWORD *)&v204[16] = 0;
                                                                                    *(void *)&v204[8] = 0x100000001;
                                                                                    int v11 = 1;
                                                                                    int v202 = 0;
                                                                                    int v203 = 1;
                                                                                    int v201 = 1;
                                                                                    int v198 = 1;
                                                                                    int v199 = 1;
                                                                                    int v193 = 1;
                                                                                    int v195 = 1;
                                                                                    uint64_t v190 = 0x100000001;
                                                                                    int v187 = 1;
                                                                                    int v191 = 1;
                                                                                    int v183 = 1;
                                                                                    int v186 = 1;
                                                                                    int v178 = 1;
                                                                                    int v184 = 1;
                                                                                    int v176 = 1;
                                                                                    int v182 = 1;
                                                                                    int v174 = 1;
                                                                                    int v180 = 1;
                                                                                    int v175 = 1;
                                                                                    int v181 = 1;
                                                                                    int v177 = 1;
                                                                                    int v179 = 1;
                                                                                    int v185 = 1;
                                                                                    int v189 = 1;
                                                                                    int v188 = 1;
                                                                                    int v192 = 1;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  int v194 = 0;
                                                                                  int v196 = 0;
                                                                                  BOOL v206 = 0;
                                                                                  int v197 = 0;
                                                                                  int v200 = 0;
                                                                                  int v12 = 0;
                                                                                  int v13 = 0;
                                                                                  int v14 = 0;
                                                                                  int v15 = 0;
                                                                                  char v16 = 0;
                                                                                  int v209 = 1;
                                                                                  int v207 = 1;
                                                                                  uint64_t v205 = 1;
                                                                                  *(void *)v204 = 0x100000001;
                                                                                  *(_DWORD *)&v204[16] = 0;
                                                                                  *(void *)&v204[8] = 0x100000001;
                                                                                  int v11 = 1;
                                                                                  int v202 = 0;
                                                                                  int v203 = 1;
                                                                                  int v201 = 1;
                                                                                  int v198 = 1;
                                                                                  int v199 = 1;
                                                                                  int v193 = 1;
                                                                                  int v195 = 1;
                                                                                  uint64_t v190 = 0x100000001;
                                                                                  int v187 = 1;
                                                                                  int v191 = 1;
                                                                                  int v183 = 1;
                                                                                  int v186 = 1;
                                                                                  int v178 = 1;
                                                                                  int v184 = 1;
                                                                                  int v176 = 1;
                                                                                  int v182 = 1;
                                                                                  int v174 = 1;
                                                                                  int v180 = 1;
                                                                                  int v175 = 1;
                                                                                  int v181 = 1;
                                                                                  int v177 = 1;
                                                                                  int v179 = 1;
                                                                                  int v185 = 1;
                                                                                  int v189 = 1;
                                                                                  int v188 = 1;
                                                                                  int v192 = 1;
                                                                                  BOOL v208 = 1;
                                                                                }
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              int v188 = 0;
                                                                              int v192 = 0;
                                                                              BOOL v208 = 0;
                                                                              int v194 = 0;
                                                                              int v196 = 0;
                                                                              BOOL v206 = 0;
                                                                              int v197 = 0;
                                                                              int v200 = 0;
                                                                              int v12 = 0;
                                                                              int v13 = 0;
                                                                              int v14 = 0;
                                                                              int v15 = 0;
                                                                              char v16 = 0;
                                                                              int v209 = 1;
                                                                              int v207 = 1;
                                                                              uint64_t v205 = 1;
                                                                              *(void *)v204 = 0x100000001;
                                                                              *(_DWORD *)&v204[16] = 0;
                                                                              *(void *)&v204[8] = 0x100000001;
                                                                              int v11 = 1;
                                                                              int v202 = 0;
                                                                              int v203 = 1;
                                                                              int v201 = 1;
                                                                              int v198 = 1;
                                                                              int v199 = 1;
                                                                              int v193 = 1;
                                                                              int v195 = 1;
                                                                              uint64_t v190 = 0x100000001;
                                                                              int v187 = 1;
                                                                              int v191 = 1;
                                                                              int v183 = 1;
                                                                              int v186 = 1;
                                                                              int v178 = 1;
                                                                              int v184 = 1;
                                                                              int v176 = 1;
                                                                              int v182 = 1;
                                                                              int v174 = 1;
                                                                              int v180 = 1;
                                                                              int v175 = 1;
                                                                              int v181 = 1;
                                                                              int v177 = 1;
                                                                              int v179 = 1;
                                                                              int v185 = 1;
                                                                              int v189 = 1;
                                                                              BOOL v210 = 1;
                                                                            }
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          int v185 = 0;
                                                                          int v189 = 0;
                                                                          BOOL v210 = 0;
                                                                          int v188 = 0;
                                                                          int v192 = 0;
                                                                          BOOL v208 = 0;
                                                                          int v194 = 0;
                                                                          int v196 = 0;
                                                                          BOOL v206 = 0;
                                                                          int v197 = 0;
                                                                          int v200 = 0;
                                                                          int v12 = 0;
                                                                          int v13 = 0;
                                                                          int v14 = 0;
                                                                          int v15 = 0;
                                                                          char v16 = 0;
                                                                          int v209 = 1;
                                                                          int v207 = 1;
                                                                          uint64_t v205 = 1;
                                                                          *(void *)v204 = 0x100000001;
                                                                          *(_DWORD *)&v204[16] = 0;
                                                                          *(void *)&v204[8] = 0x100000001;
                                                                          int v11 = 1;
                                                                          int v202 = 0;
                                                                          int v203 = 1;
                                                                          int v201 = 1;
                                                                          int v198 = 1;
                                                                          int v199 = 1;
                                                                          int v193 = 1;
                                                                          int v195 = 1;
                                                                          uint64_t v190 = 0x100000001;
                                                                          int v187 = 1;
                                                                          int v191 = 1;
                                                                          int v183 = 1;
                                                                          int v186 = 1;
                                                                          int v178 = 1;
                                                                          int v184 = 1;
                                                                          int v176 = 1;
                                                                          int v182 = 1;
                                                                          int v174 = 1;
                                                                          int v180 = 1;
                                                                          int v175 = 1;
                                                                          int v181 = 1;
                                                                          int v177 = 1;
                                                                          int v179 = 1;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        int v185 = 0;
                                                                        int v189 = 0;
                                                                        BOOL v210 = 0;
                                                                        int v188 = 0;
                                                                        int v192 = 0;
                                                                        BOOL v208 = 0;
                                                                        int v194 = 0;
                                                                        int v196 = 0;
                                                                        BOOL v206 = 0;
                                                                        int v197 = 0;
                                                                        int v200 = 0;
                                                                        int v12 = 0;
                                                                        int v13 = 0;
                                                                        int v14 = 0;
                                                                        int v15 = 0;
                                                                        char v16 = 0;
                                                                        int v209 = 1;
                                                                        int v207 = 1;
                                                                        uint64_t v205 = 1;
                                                                        *(void *)v204 = 0x100000001;
                                                                        *(_DWORD *)&v204[16] = 0;
                                                                        *(void *)&v204[8] = 0x100000001;
                                                                        int v11 = 1;
                                                                        int v202 = 0;
                                                                        int v203 = 1;
                                                                        int v201 = 1;
                                                                        int v198 = 1;
                                                                        int v199 = 1;
                                                                        int v193 = 1;
                                                                        int v195 = 1;
                                                                        uint64_t v190 = 0x100000001;
                                                                        int v187 = 1;
                                                                        int v191 = 1;
                                                                        int v183 = 1;
                                                                        int v186 = 1;
                                                                        int v178 = 1;
                                                                        int v184 = 1;
                                                                        int v176 = 1;
                                                                        int v182 = 1;
                                                                        int v174 = 1;
                                                                        int v180 = 1;
                                                                        int v175 = 1;
                                                                        int v181 = 1;
                                                                        int v177 = 1;
                                                                        int v179 = 1;
                                                                        BOOL v211 = 1;
                                                                      }
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    int v177 = 0;
                                                                    int v179 = 0;
                                                                    BOOL v211 = 0;
                                                                    int v185 = 0;
                                                                    int v189 = 0;
                                                                    BOOL v210 = 0;
                                                                    int v188 = 0;
                                                                    int v192 = 0;
                                                                    BOOL v208 = 0;
                                                                    int v194 = 0;
                                                                    int v196 = 0;
                                                                    BOOL v206 = 0;
                                                                    int v197 = 0;
                                                                    int v200 = 0;
                                                                    int v12 = 0;
                                                                    int v13 = 0;
                                                                    int v14 = 0;
                                                                    int v15 = 0;
                                                                    char v16 = 0;
                                                                    int v209 = 1;
                                                                    int v207 = 1;
                                                                    uint64_t v205 = 1;
                                                                    *(void *)v204 = 0x100000001;
                                                                    *(_DWORD *)&v204[16] = 0;
                                                                    *(void *)&v204[8] = 0x100000001;
                                                                    int v11 = 1;
                                                                    int v202 = 0;
                                                                    int v203 = 1;
                                                                    int v201 = 1;
                                                                    int v198 = 1;
                                                                    int v199 = 1;
                                                                    int v193 = 1;
                                                                    int v195 = 1;
                                                                    uint64_t v190 = 0x100000001;
                                                                    int v187 = 1;
                                                                    int v191 = 1;
                                                                    int v183 = 1;
                                                                    int v186 = 1;
                                                                    int v178 = 1;
                                                                    int v184 = 1;
                                                                    int v176 = 1;
                                                                    int v182 = 1;
                                                                    int v174 = 1;
                                                                    int v180 = 1;
                                                                    int v175 = 1;
                                                                    int v181 = 1;
                                                                    BOOL v212 = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                int v175 = 0;
                                                                int v181 = 0;
                                                                BOOL v212 = 0;
                                                                int v177 = 0;
                                                                int v179 = 0;
                                                                BOOL v211 = 0;
                                                                int v185 = 0;
                                                                int v189 = 0;
                                                                BOOL v210 = 0;
                                                                int v188 = 0;
                                                                int v192 = 0;
                                                                BOOL v208 = 0;
                                                                int v194 = 0;
                                                                int v196 = 0;
                                                                BOOL v206 = 0;
                                                                int v197 = 0;
                                                                int v200 = 0;
                                                                int v12 = 0;
                                                                int v13 = 0;
                                                                int v14 = 0;
                                                                int v15 = 0;
                                                                char v16 = 0;
                                                                int v209 = 1;
                                                                int v207 = 1;
                                                                uint64_t v205 = 1;
                                                                *(void *)v204 = 0x100000001;
                                                                *(_DWORD *)&v204[16] = 0;
                                                                *(void *)&v204[8] = 0x100000001;
                                                                int v11 = 1;
                                                                int v202 = 0;
                                                                int v203 = 1;
                                                                int v201 = 1;
                                                                int v198 = 1;
                                                                int v199 = 1;
                                                                int v193 = 1;
                                                                int v195 = 1;
                                                                uint64_t v190 = 0x100000001;
                                                                int v187 = 1;
                                                                int v191 = 1;
                                                                int v183 = 1;
                                                                int v186 = 1;
                                                                int v178 = 1;
                                                                int v184 = 1;
                                                                int v176 = 1;
                                                                int v182 = 1;
                                                                int v174 = 1;
                                                                int v180 = 1;
                                                                BOOL v213 = 1;
                                                              }
                                                            }
                                                          }
                                                          else
                                                          {
                                                            int v174 = 0;
                                                            int v180 = 0;
                                                            BOOL v213 = 0;
                                                            int v175 = 0;
                                                            int v181 = 0;
                                                            BOOL v212 = 0;
                                                            int v177 = 0;
                                                            int v179 = 0;
                                                            BOOL v211 = 0;
                                                            int v185 = 0;
                                                            int v189 = 0;
                                                            BOOL v210 = 0;
                                                            int v188 = 0;
                                                            int v192 = 0;
                                                            BOOL v208 = 0;
                                                            int v194 = 0;
                                                            int v196 = 0;
                                                            BOOL v206 = 0;
                                                            int v197 = 0;
                                                            int v200 = 0;
                                                            int v12 = 0;
                                                            int v13 = 0;
                                                            int v14 = 0;
                                                            int v15 = 0;
                                                            char v16 = 0;
                                                            int v209 = 1;
                                                            int v207 = 1;
                                                            uint64_t v205 = 1;
                                                            *(void *)v204 = 0x100000001;
                                                            *(_DWORD *)&v204[16] = 0;
                                                            *(void *)&v204[8] = 0x100000001;
                                                            int v11 = 1;
                                                            int v202 = 0;
                                                            int v203 = 1;
                                                            int v201 = 1;
                                                            int v198 = 1;
                                                            int v199 = 1;
                                                            int v193 = 1;
                                                            int v195 = 1;
                                                            uint64_t v190 = 0x100000001;
                                                            int v187 = 1;
                                                            int v191 = 1;
                                                            int v183 = 1;
                                                            int v186 = 1;
                                                            int v178 = 1;
                                                            int v184 = 1;
                                                            int v176 = 1;
                                                            int v182 = 1;
                                                            BOOL v214 = 1;
                                                          }
                                                        }
                                                      }
                                                      else
                                                      {
                                                        int v176 = 0;
                                                        int v182 = 0;
                                                        BOOL v214 = 0;
                                                        int v174 = 0;
                                                        int v180 = 0;
                                                        BOOL v213 = 0;
                                                        int v175 = 0;
                                                        int v181 = 0;
                                                        BOOL v212 = 0;
                                                        int v177 = 0;
                                                        int v179 = 0;
                                                        BOOL v211 = 0;
                                                        int v185 = 0;
                                                        int v189 = 0;
                                                        BOOL v210 = 0;
                                                        int v188 = 0;
                                                        int v192 = 0;
                                                        BOOL v208 = 0;
                                                        int v194 = 0;
                                                        int v196 = 0;
                                                        BOOL v206 = 0;
                                                        int v197 = 0;
                                                        int v200 = 0;
                                                        int v12 = 0;
                                                        int v13 = 0;
                                                        int v14 = 0;
                                                        int v15 = 0;
                                                        char v16 = 0;
                                                        int v209 = 1;
                                                        int v207 = 1;
                                                        uint64_t v205 = 1;
                                                        *(void *)v204 = 0x100000001;
                                                        *(_DWORD *)&v204[16] = 0;
                                                        *(void *)&v204[8] = 0x100000001;
                                                        int v11 = 1;
                                                        int v202 = 0;
                                                        int v203 = 1;
                                                        int v201 = 1;
                                                        int v198 = 1;
                                                        int v199 = 1;
                                                        int v193 = 1;
                                                        int v195 = 1;
                                                        uint64_t v190 = 0x100000001;
                                                        int v187 = 1;
                                                        int v191 = 1;
                                                        int v183 = 1;
                                                        int v186 = 1;
                                                        int v178 = 1;
                                                        int v184 = 1;
                                                        BOOL v215 = 1;
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                    int v178 = 0;
                                                    int v184 = 0;
                                                    BOOL v215 = 0;
                                                    int v176 = 0;
                                                    int v182 = 0;
                                                    BOOL v214 = 0;
                                                    int v174 = 0;
                                                    int v180 = 0;
                                                    BOOL v213 = 0;
                                                    int v175 = 0;
                                                    int v181 = 0;
                                                    BOOL v212 = 0;
                                                    int v177 = 0;
                                                    int v179 = 0;
                                                    BOOL v211 = 0;
                                                    int v185 = 0;
                                                    int v189 = 0;
                                                    BOOL v210 = 0;
                                                    int v188 = 0;
                                                    int v192 = 0;
                                                    BOOL v208 = 0;
                                                    int v194 = 0;
                                                    int v196 = 0;
                                                    BOOL v206 = 0;
                                                    int v197 = 0;
                                                    int v200 = 0;
                                                    int v12 = 0;
                                                    int v13 = 0;
                                                    int v14 = 0;
                                                    int v15 = 0;
                                                    char v16 = 0;
                                                    int v209 = 1;
                                                    int v207 = 1;
                                                    uint64_t v205 = 1;
                                                    *(void *)v204 = 0x100000001;
                                                    *(_DWORD *)&v204[16] = 0;
                                                    *(void *)&v204[8] = 0x100000001;
                                                    int v11 = 1;
                                                    int v202 = 0;
                                                    int v203 = 1;
                                                    int v201 = 1;
                                                    int v198 = 1;
                                                    int v199 = 1;
                                                    int v193 = 1;
                                                    int v195 = 1;
                                                    uint64_t v190 = 0x100000001;
                                                    int v187 = 1;
                                                    int v191 = 1;
                                                    int v183 = 1;
                                                    int v186 = 1;
                                                    BOOL v216 = 1;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                int v183 = 0;
                                                int v186 = 0;
                                                BOOL v216 = 0;
                                                int v178 = 0;
                                                int v184 = 0;
                                                BOOL v215 = 0;
                                                int v176 = 0;
                                                int v182 = 0;
                                                BOOL v214 = 0;
                                                int v174 = 0;
                                                int v180 = 0;
                                                BOOL v213 = 0;
                                                int v175 = 0;
                                                int v181 = 0;
                                                BOOL v212 = 0;
                                                int v177 = 0;
                                                int v179 = 0;
                                                BOOL v211 = 0;
                                                int v185 = 0;
                                                int v189 = 0;
                                                BOOL v210 = 0;
                                                int v188 = 0;
                                                int v192 = 0;
                                                BOOL v208 = 0;
                                                int v194 = 0;
                                                int v196 = 0;
                                                BOOL v206 = 0;
                                                int v197 = 0;
                                                int v200 = 0;
                                                int v12 = 0;
                                                int v13 = 0;
                                                int v14 = 0;
                                                int v15 = 0;
                                                char v16 = 0;
                                                int v209 = 1;
                                                int v207 = 1;
                                                uint64_t v205 = 1;
                                                *(void *)v204 = 0x100000001;
                                                *(_DWORD *)&v204[16] = 0;
                                                *(void *)&v204[8] = 0x100000001;
                                                int v11 = 1;
                                                int v202 = 0;
                                                int v203 = 1;
                                                int v201 = 1;
                                                int v198 = 1;
                                                int v199 = 1;
                                                int v193 = 1;
                                                int v195 = 1;
                                                uint64_t v190 = 0x100000001;
                                                int v187 = 1;
                                                int v191 = 1;
                                                BOOL v217 = 1;
                                              }
                                            }
                                          }
                                          else
                                          {
                                            int v187 = 0;
                                            int v191 = 0;
                                            BOOL v217 = 0;
                                            int v183 = 0;
                                            int v186 = 0;
                                            BOOL v216 = 0;
                                            int v178 = 0;
                                            int v184 = 0;
                                            BOOL v215 = 0;
                                            int v176 = 0;
                                            int v182 = 0;
                                            BOOL v214 = 0;
                                            int v174 = 0;
                                            int v180 = 0;
                                            BOOL v213 = 0;
                                            int v175 = 0;
                                            int v181 = 0;
                                            BOOL v212 = 0;
                                            int v177 = 0;
                                            int v179 = 0;
                                            BOOL v211 = 0;
                                            int v185 = 0;
                                            int v189 = 0;
                                            BOOL v210 = 0;
                                            int v188 = 0;
                                            int v192 = 0;
                                            BOOL v208 = 0;
                                            int v194 = 0;
                                            int v196 = 0;
                                            BOOL v206 = 0;
                                            int v197 = 0;
                                            int v200 = 0;
                                            int v12 = 0;
                                            int v13 = 0;
                                            int v14 = 0;
                                            int v15 = 0;
                                            char v16 = 0;
                                            int v209 = 1;
                                            int v207 = 1;
                                            uint64_t v205 = 1;
                                            *(void *)v204 = 0x100000001;
                                            *(_DWORD *)&v204[16] = 0;
                                            *(void *)&v204[8] = 0x100000001;
                                            int v11 = 1;
                                            int v202 = 0;
                                            int v203 = 1;
                                            int v201 = 1;
                                            int v198 = 1;
                                            int v199 = 1;
                                            int v193 = 1;
                                            int v195 = 1;
                                            uint64_t v190 = 0x100000001;
                                          }
                                        }
                                        else
                                        {
                                          int v187 = 0;
                                          int v191 = 0;
                                          BOOL v217 = 0;
                                          int v183 = 0;
                                          int v186 = 0;
                                          BOOL v216 = 0;
                                          int v178 = 0;
                                          int v184 = 0;
                                          BOOL v215 = 0;
                                          int v176 = 0;
                                          int v182 = 0;
                                          BOOL v214 = 0;
                                          int v174 = 0;
                                          int v180 = 0;
                                          BOOL v213 = 0;
                                          int v175 = 0;
                                          int v181 = 0;
                                          BOOL v212 = 0;
                                          int v177 = 0;
                                          int v179 = 0;
                                          BOOL v211 = 0;
                                          int v185 = 0;
                                          int v189 = 0;
                                          BOOL v210 = 0;
                                          int v188 = 0;
                                          int v192 = 0;
                                          BOOL v208 = 0;
                                          int v194 = 0;
                                          int v196 = 0;
                                          BOOL v206 = 0;
                                          int v197 = 0;
                                          int v200 = 0;
                                          int v12 = 0;
                                          int v13 = 0;
                                          int v14 = 0;
                                          int v15 = 0;
                                          char v16 = 0;
                                          int v209 = 1;
                                          int v207 = 1;
                                          uint64_t v205 = 1;
                                          *(void *)v204 = 0x100000001;
                                          *(_DWORD *)&v204[16] = 0;
                                          *(void *)&v204[8] = 0x100000001;
                                          int v11 = 1;
                                          int v202 = 0;
                                          int v203 = 1;
                                          int v201 = 1;
                                          int v198 = 1;
                                          int v199 = 1;
                                          int v193 = 1;
                                          int v195 = 1;
                                          uint64_t v190 = 0x100000001;
                                          BOOL v223 = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v190 = 0;
                                      BOOL v223 = 0;
                                      int v187 = 0;
                                      int v191 = 0;
                                      BOOL v217 = 0;
                                      int v183 = 0;
                                      int v186 = 0;
                                      BOOL v216 = 0;
                                      int v178 = 0;
                                      int v184 = 0;
                                      BOOL v215 = 0;
                                      int v176 = 0;
                                      int v182 = 0;
                                      BOOL v214 = 0;
                                      int v174 = 0;
                                      int v180 = 0;
                                      BOOL v213 = 0;
                                      int v175 = 0;
                                      int v181 = 0;
                                      BOOL v212 = 0;
                                      int v177 = 0;
                                      int v179 = 0;
                                      BOOL v211 = 0;
                                      int v185 = 0;
                                      int v189 = 0;
                                      BOOL v210 = 0;
                                      int v188 = 0;
                                      int v192 = 0;
                                      BOOL v208 = 0;
                                      int v194 = 0;
                                      int v196 = 0;
                                      BOOL v206 = 0;
                                      int v197 = 0;
                                      int v200 = 0;
                                      int v12 = 0;
                                      int v13 = 0;
                                      int v14 = 0;
                                      int v15 = 0;
                                      char v16 = 0;
                                      int v209 = 1;
                                      int v207 = 1;
                                      uint64_t v205 = 1;
                                      *(void *)v204 = 0x100000001;
                                      *(_DWORD *)&v204[16] = 0;
                                      *(void *)&v204[8] = 0x100000001;
                                      int v11 = 1;
                                      int v202 = 0;
                                      int v203 = 1;
                                      int v201 = 1;
                                      int v198 = 1;
                                      int v199 = 1;
                                      int v193 = 1;
                                      int v195 = 1;
                                      BOOL v224 = 1;
                                    }
                                  }
                                }
                                else
                                {
                                  int v193 = 0;
                                  int v195 = 0;
                                  BOOL v224 = 0;
                                  uint64_t v190 = 0;
                                  BOOL v223 = 0;
                                  int v187 = 0;
                                  int v191 = 0;
                                  BOOL v217 = 0;
                                  int v183 = 0;
                                  int v186 = 0;
                                  BOOL v216 = 0;
                                  int v178 = 0;
                                  int v184 = 0;
                                  BOOL v215 = 0;
                                  int v176 = 0;
                                  int v182 = 0;
                                  BOOL v214 = 0;
                                  int v174 = 0;
                                  int v180 = 0;
                                  BOOL v213 = 0;
                                  int v175 = 0;
                                  int v181 = 0;
                                  BOOL v212 = 0;
                                  int v177 = 0;
                                  int v179 = 0;
                                  BOOL v211 = 0;
                                  int v185 = 0;
                                  int v189 = 0;
                                  BOOL v210 = 0;
                                  int v188 = 0;
                                  int v192 = 0;
                                  BOOL v208 = 0;
                                  int v194 = 0;
                                  int v196 = 0;
                                  BOOL v206 = 0;
                                  int v197 = 0;
                                  int v200 = 0;
                                  int v12 = 0;
                                  int v13 = 0;
                                  int v14 = 0;
                                  int v15 = 0;
                                  char v16 = 0;
                                  int v209 = 1;
                                  int v207 = 1;
                                  uint64_t v205 = 1;
                                  *(void *)v204 = 0x100000001;
                                  *(_DWORD *)&v204[16] = 0;
                                  *(void *)&v204[8] = 0x100000001;
                                  int v11 = 1;
                                  int v202 = 0;
                                  int v203 = 1;
                                  int v201 = 1;
                                  int v198 = 1;
                                  int v199 = 1;
                                  BOOL v225 = 1;
                                }
                              }
                            }
                            else
                            {
                              int v198 = 0;
                              int v199 = 0;
                              BOOL v225 = 0;
                              int v193 = 0;
                              int v195 = 0;
                              BOOL v224 = 0;
                              uint64_t v190 = 0;
                              BOOL v223 = 0;
                              int v187 = 0;
                              int v191 = 0;
                              BOOL v217 = 0;
                              int v183 = 0;
                              int v186 = 0;
                              BOOL v216 = 0;
                              int v178 = 0;
                              int v184 = 0;
                              BOOL v215 = 0;
                              int v176 = 0;
                              int v182 = 0;
                              BOOL v214 = 0;
                              int v174 = 0;
                              int v180 = 0;
                              BOOL v213 = 0;
                              int v175 = 0;
                              int v181 = 0;
                              BOOL v212 = 0;
                              int v177 = 0;
                              int v179 = 0;
                              BOOL v211 = 0;
                              int v185 = 0;
                              int v189 = 0;
                              BOOL v210 = 0;
                              int v188 = 0;
                              int v192 = 0;
                              BOOL v208 = 0;
                              int v194 = 0;
                              int v196 = 0;
                              BOOL v206 = 0;
                              int v197 = 0;
                              int v200 = 0;
                              int v12 = 0;
                              int v13 = 0;
                              int v14 = 0;
                              int v15 = 0;
                              char v16 = 0;
                              int v209 = 1;
                              int v207 = 1;
                              uint64_t v205 = 1;
                              *(void *)v204 = 0x100000001;
                              *(_DWORD *)&v204[16] = 0;
                              *(void *)&v204[8] = 0x100000001;
                              int v11 = 1;
                              int v202 = 0;
                              int v203 = 1;
                              int v201 = 1;
                            }
                          }
                          else
                          {
                            int v198 = 0;
                            int v199 = 0;
                            BOOL v225 = 0;
                            int v193 = 0;
                            int v195 = 0;
                            BOOL v224 = 0;
                            uint64_t v190 = 0;
                            BOOL v223 = 0;
                            int v187 = 0;
                            int v191 = 0;
                            BOOL v217 = 0;
                            int v183 = 0;
                            int v186 = 0;
                            BOOL v216 = 0;
                            int v178 = 0;
                            int v184 = 0;
                            BOOL v215 = 0;
                            int v176 = 0;
                            int v182 = 0;
                            BOOL v214 = 0;
                            int v174 = 0;
                            int v180 = 0;
                            BOOL v213 = 0;
                            int v175 = 0;
                            int v181 = 0;
                            BOOL v212 = 0;
                            int v177 = 0;
                            int v179 = 0;
                            BOOL v211 = 0;
                            int v185 = 0;
                            int v189 = 0;
                            BOOL v210 = 0;
                            int v188 = 0;
                            int v192 = 0;
                            BOOL v208 = 0;
                            int v194 = 0;
                            int v196 = 0;
                            BOOL v206 = 0;
                            int v197 = 0;
                            int v200 = 0;
                            int v12 = 0;
                            int v13 = 0;
                            int v14 = 0;
                            int v15 = 0;
                            char v16 = 0;
                            int v209 = 1;
                            int v207 = 1;
                            uint64_t v205 = 1;
                            *(void *)v204 = 0x100000001;
                            *(_DWORD *)&v204[16] = 0;
                            *(void *)&v204[8] = 0x100000001;
                            int v11 = 1;
                            int v202 = 0;
                            int v203 = 1;
                            int v201 = 1;
                            LODWORD(v226) = 1;
                          }
                        }
                      }
                      else
                      {
                        int v203 = 0;
                        int v201 = 0;
                        *(void *)&long long v226 = 0x100000000;
                        int v198 = 0;
                        int v199 = 0;
                        BOOL v225 = 0;
                        int v193 = 0;
                        int v195 = 0;
                        BOOL v224 = 0;
                        uint64_t v190 = 0;
                        BOOL v223 = 0;
                        int v187 = 0;
                        int v191 = 0;
                        BOOL v217 = 0;
                        int v183 = 0;
                        int v186 = 0;
                        BOOL v216 = 0;
                        int v178 = 0;
                        int v184 = 0;
                        BOOL v215 = 0;
                        int v176 = 0;
                        int v182 = 0;
                        BOOL v214 = 0;
                        int v174 = 0;
                        int v180 = 0;
                        BOOL v213 = 0;
                        int v175 = 0;
                        int v181 = 0;
                        BOOL v212 = 0;
                        int v177 = 0;
                        int v179 = 0;
                        BOOL v211 = 0;
                        int v185 = 0;
                        int v189 = 0;
                        BOOL v210 = 0;
                        int v188 = 0;
                        int v192 = 0;
                        BOOL v208 = 0;
                        int v194 = 0;
                        int v196 = 0;
                        BOOL v206 = 0;
                        int v197 = 0;
                        int v200 = 0;
                        int v202 = 0;
                        int v12 = 0;
                        int v13 = 0;
                        int v14 = 0;
                        int v15 = 0;
                        char v16 = 0;
                        int v209 = 1;
                        int v207 = 1;
                        uint64_t v205 = 1;
                        *(void *)v204 = 0x100000001;
                        *(_DWORD *)&v204[16] = 0;
                        *(void *)&v204[8] = 0x100000001;
                        int v11 = 1;
                      }
                    }
                  }
                  else
                  {
                    int v11 = 0;
                    *(void *)&long long v226 = 0;
                    int v203 = 0;
                    int v201 = 0;
                    int v198 = 0;
                    int v199 = 0;
                    BOOL v225 = 0;
                    int v193 = 0;
                    int v195 = 0;
                    BOOL v224 = 0;
                    uint64_t v190 = 0;
                    BOOL v223 = 0;
                    int v187 = 0;
                    int v191 = 0;
                    BOOL v217 = 0;
                    int v183 = 0;
                    int v186 = 0;
                    BOOL v216 = 0;
                    int v178 = 0;
                    int v184 = 0;
                    BOOL v215 = 0;
                    int v176 = 0;
                    int v182 = 0;
                    BOOL v214 = 0;
                    int v174 = 0;
                    int v180 = 0;
                    BOOL v213 = 0;
                    int v175 = 0;
                    int v181 = 0;
                    BOOL v212 = 0;
                    int v177 = 0;
                    int v179 = 0;
                    BOOL v211 = 0;
                    int v185 = 0;
                    int v189 = 0;
                    BOOL v210 = 0;
                    int v188 = 0;
                    int v192 = 0;
                    BOOL v208 = 0;
                    int v194 = 0;
                    int v196 = 0;
                    BOOL v206 = 0;
                    int v197 = 0;
                    int v200 = 0;
                    int v202 = 0;
                    int v12 = 0;
                    int v13 = 0;
                    int v14 = 0;
                    int v15 = 0;
                    char v16 = 0;
                    int v209 = 1;
                    int v207 = 1;
                    uint64_t v205 = 1;
                    *(void *)v204 = 1;
                    *(_DWORD *)&v204[16] = 0;
                    *(void *)&v204[8] = 0x100000001;
                  }
                  goto LABEL_16;
                }
                *(void *)&v204[4] = 0;
                LODWORD(v218) = 0;
                int v11 = 0;
                *(void *)&long long v226 = 0;
                int v203 = 0;
                int v201 = 0;
                int v198 = 0;
                int v199 = 0;
                BOOL v225 = 0;
                int v193 = 0;
                int v195 = 0;
                BOOL v224 = 0;
                uint64_t v190 = 0;
                BOOL v223 = 0;
                int v187 = 0;
                int v191 = 0;
                BOOL v217 = 0;
                int v183 = 0;
                int v186 = 0;
                BOOL v216 = 0;
                int v178 = 0;
                int v184 = 0;
                BOOL v215 = 0;
                int v176 = 0;
                int v182 = 0;
                BOOL v214 = 0;
                int v174 = 0;
                int v180 = 0;
                BOOL v213 = 0;
                int v175 = 0;
                int v181 = 0;
                BOOL v212 = 0;
                int v177 = 0;
                int v179 = 0;
                BOOL v211 = 0;
                int v185 = 0;
                int v189 = 0;
                BOOL v210 = 0;
                int v188 = 0;
                int v192 = 0;
                BOOL v208 = 0;
                int v194 = 0;
                int v196 = 0;
                BOOL v206 = 0;
                int v197 = 0;
                int v200 = 0;
                int v202 = 0;
                int v12 = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                char v16 = 0;
                int v209 = 1;
                int v207 = 1;
                uint64_t v205 = 1;
                *(_DWORD *)v204 = 1;
                *(void *)&v204[12] = 1;
              }
              else
              {
                LODWORD(v218) = 0;
                int v11 = 0;
                *(void *)&long long v226 = 0;
                int v203 = 0;
                int v201 = 0;
                int v198 = 0;
                int v199 = 0;
                BOOL v225 = 0;
                int v193 = 0;
                int v195 = 0;
                BOOL v224 = 0;
                uint64_t v190 = 0;
                BOOL v223 = 0;
                int v187 = 0;
                int v191 = 0;
                BOOL v217 = 0;
                int v183 = 0;
                int v186 = 0;
                BOOL v216 = 0;
                int v178 = 0;
                int v184 = 0;
                BOOL v215 = 0;
                int v176 = 0;
                int v182 = 0;
                BOOL v214 = 0;
                int v174 = 0;
                int v180 = 0;
                BOOL v213 = 0;
                int v175 = 0;
                int v181 = 0;
                BOOL v212 = 0;
                int v177 = 0;
                int v179 = 0;
                BOOL v211 = 0;
                int v185 = 0;
                int v189 = 0;
                BOOL v210 = 0;
                int v188 = 0;
                int v192 = 0;
                BOOL v208 = 0;
                int v194 = 0;
                int v196 = 0;
                BOOL v206 = 0;
                int v197 = 0;
                int v200 = 0;
                int v202 = 0;
                int v12 = 0;
                *(_DWORD *)&v204[16] = 0;
                int v13 = 0;
                int v14 = 0;
                int v15 = 0;
                char v16 = 0;
                int v209 = 1;
                int v207 = 1;
                uint64_t v205 = 1;
                *(_OWORD *)v204 = 1uLL;
              }
            }
            else
            {
              LODWORD(v218) = 0;
              int v11 = 0;
              *(void *)&long long v226 = 0;
              int v203 = 0;
              int v201 = 0;
              int v198 = 0;
              int v199 = 0;
              BOOL v225 = 0;
              int v193 = 0;
              int v195 = 0;
              BOOL v224 = 0;
              uint64_t v190 = 0;
              BOOL v223 = 0;
              int v187 = 0;
              int v191 = 0;
              BOOL v217 = 0;
              int v183 = 0;
              int v186 = 0;
              BOOL v216 = 0;
              int v178 = 0;
              int v184 = 0;
              BOOL v215 = 0;
              int v176 = 0;
              int v182 = 0;
              BOOL v214 = 0;
              int v174 = 0;
              int v180 = 0;
              BOOL v213 = 0;
              int v175 = 0;
              int v181 = 0;
              BOOL v212 = 0;
              int v177 = 0;
              int v179 = 0;
              BOOL v211 = 0;
              int v185 = 0;
              int v189 = 0;
              BOOL v210 = 0;
              int v188 = 0;
              int v192 = 0;
              BOOL v208 = 0;
              int v194 = 0;
              int v196 = 0;
              BOOL v206 = 0;
              int v197 = 0;
              int v200 = 0;
              int v202 = 0;
              int v12 = 0;
              *(_DWORD *)&v204[16] = 0;
              int v13 = 0;
              int v14 = 0;
              int v15 = 0;
              char v16 = 0;
              int v209 = 1;
              int v207 = 1;
              uint64_t v205 = 1;
              *(_OWORD *)v204 = 1uLL;
              DWORD2(v226) = 1;
            }
          }
        }
        else
        {
          uint64_t v205 = 0;
          memset(v204, 0, sizeof(v204));
          *(void *)((char *)&v226 + 4) = 0;
          LODWORD(v218) = 0;
          int v11 = 0;
          int v203 = 0;
          int v201 = 0;
          LODWORD(v226) = 0;
          int v198 = 0;
          int v199 = 0;
          BOOL v225 = 0;
          int v193 = 0;
          int v195 = 0;
          BOOL v224 = 0;
          uint64_t v190 = 0;
          BOOL v223 = 0;
          int v187 = 0;
          int v191 = 0;
          BOOL v217 = 0;
          int v183 = 0;
          int v186 = 0;
          BOOL v216 = 0;
          int v178 = 0;
          int v184 = 0;
          BOOL v215 = 0;
          int v176 = 0;
          int v182 = 0;
          BOOL v214 = 0;
          int v174 = 0;
          int v180 = 0;
          BOOL v213 = 0;
          int v175 = 0;
          int v181 = 0;
          BOOL v212 = 0;
          int v177 = 0;
          int v179 = 0;
          BOOL v211 = 0;
          int v185 = 0;
          int v189 = 0;
          BOOL v210 = 0;
          int v188 = 0;
          int v192 = 0;
          BOOL v208 = 0;
          int v194 = 0;
          int v196 = 0;
          BOOL v206 = 0;
          int v197 = 0;
          int v200 = 0;
          int v202 = 0;
          int v12 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          char v16 = 0;
          int v209 = 1;
          int v207 = 1;
          HIDWORD(v226) = 1;
        }
      }
    }
    else
    {
      int v209 = 0;
      int v207 = 0;
      long long v226 = 0uLL;
      uint64_t v205 = 0;
      memset(v204, 0, sizeof(v204));
      uint64_t v218 = 0x100000000;
      int v11 = 0;
      int v203 = 0;
      int v201 = 0;
      int v198 = 0;
      int v199 = 0;
      BOOL v225 = 0;
      int v193 = 0;
      int v195 = 0;
      BOOL v224 = 0;
      uint64_t v190 = 0;
      BOOL v223 = 0;
      int v187 = 0;
      int v191 = 0;
      BOOL v217 = 0;
      int v183 = 0;
      int v186 = 0;
      BOOL v216 = 0;
      int v178 = 0;
      int v184 = 0;
      BOOL v215 = 0;
      int v176 = 0;
      int v182 = 0;
      BOOL v214 = 0;
      int v174 = 0;
      int v180 = 0;
      BOOL v213 = 0;
      int v175 = 0;
      int v181 = 0;
      BOOL v212 = 0;
      int v177 = 0;
      int v179 = 0;
      BOOL v211 = 0;
      int v185 = 0;
      int v189 = 0;
      BOOL v210 = 0;
      int v188 = 0;
      int v192 = 0;
      BOOL v208 = 0;
      int v194 = 0;
      int v196 = 0;
      BOOL v206 = 0;
      int v197 = 0;
      int v200 = 0;
      int v202 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      char v16 = 0;
    }
  }
LABEL_16:
  if (v15)
  {
    int v18 = v12;
    int v19 = v13;
    uint64_t v20 = v7;
    int v21 = v11;
    int v22 = v14;

    int v14 = v22;
    int v11 = v21;
    uint64_t v7 = v20;
    int v13 = v19;
    int v12 = v18;
  }
  if (v14) {

  }
  if (v13)
  {
  }
  if (*(_DWORD *)&v204[16])
  {
  }
  if (v12) {

  }
  if (v202)
  {
  }
  if (HIDWORD(v205))
  {
  }
  if (v200) {

  }
  if (v197)
  {
  }
  if (v206)
  {
  }
  if (v196) {

  }
  if (v194)
  {
  }
  if (v208)
  {
  }
  if (v192) {

  }
  if (v188)
  {
  }
  if (v210)
  {
  }
  if (v189) {

  }
  if (v185)
  {
  }
  if (v211)
  {
  }
  if (v179) {

  }
  if (v177)
  {
  }
  if (v212)
  {
  }
  if (v181) {

  }
  if (v175)
  {
  }
  if (v213)
  {
  }
  if (v180) {

  }
  if (v174)
  {
  }
  if (v214)
  {
  }
  if (v182) {

  }
  if (v176)
  {
  }
  if (v215)
  {
  }
  if (v184) {

  }
  if (v178)
  {
  }
  if (v216)
  {
  }
  if (v186) {

  }
  if (v183)
  {
  }
  if (v217)
  {
  }
  if (v191) {

  }
  if (v187)
  {
  }
  if (v223)
  {
  }
  if (v190) {

  }
  if (HIDWORD(v190))
  {
  }
  if (v224)
  {
  }
  if (v195) {

  }
  if (v193)
  {
  }
  if (v225)
  {
  }
  if (v199) {

  }
  if (v198)
  {
  }
  if (v226)
  {
  }
  if (v201) {

  }
  if (v203)
  {
  }
  if (DWORD1(v226))
  {
  }
  if (*(_DWORD *)&v204[4]) {

  }
  if (v11)
  {
  }
  if (v218)
  {
  }
  if (*(_DWORD *)&v204[8]) {

  }
  if (*(_DWORD *)&v204[12])
  {
  }
  if (DWORD2(v226))
  {
  }
  if (*(_DWORD *)v204) {

  }
  if (v205)
  {
  }
  if (HIDWORD(v226))
  {
  }
  if (v207) {

  }
  if (v209)
  {
  }
  if (HIDWORD(v218))
  {
  }
  if (v220 != v219) {

  }
LABEL_147:
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v50.receiver = self;
  v50.super_class = (Class)SFDetailedRowCardSection;
  id v4 = [(SFCardSection *)&v50 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  int v11 = [(SFDetailedRowCardSection *)self type];
  int v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  int v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  int v15 = [(SFDetailedRowCardSection *)self thumbnail];
  char v16 = (void *)[v15 copy];
  [v4 setThumbnail:v16];

  objc_msgSend(v4, "setPreventThumbnailImageScaling:", -[SFDetailedRowCardSection preventThumbnailImageScaling](self, "preventThumbnailImageScaling"));
  uint64_t v17 = [(SFDetailedRowCardSection *)self title];
  int v18 = (void *)[v17 copy];
  [v4 setTitle:v18];

  int v19 = [(SFDetailedRowCardSection *)self secondaryTitle];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setSecondaryTitle:v20];

  int v21 = [(SFDetailedRowCardSection *)self secondaryTitleImage];
  int v22 = (void *)[v21 copy];
  [v4 setSecondaryTitleImage:v22];

  objc_msgSend(v4, "setIsSecondaryTitleDetached:", -[SFDetailedRowCardSection isSecondaryTitleDetached](self, "isSecondaryTitleDetached"));
  uint64_t v23 = [(SFDetailedRowCardSection *)self descriptions];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setDescriptions:v24];

  BOOL v25 = [(SFDetailedRowCardSection *)self footnote];
  BOOL v26 = (void *)[v25 copy];
  [v4 setFootnote:v26];

  BOOL v27 = [(SFDetailedRowCardSection *)self trailingTopText];
  uint64_t v28 = (void *)[v27 copy];
  [v4 setTrailingTopText:v28];

  BOOL v29 = [(SFDetailedRowCardSection *)self trailingMiddleText];
  int v30 = (void *)[v29 copy];
  [v4 setTrailingMiddleText:v30];

  uint64_t v31 = [(SFDetailedRowCardSection *)self trailingBottomText];
  uint64_t v32 = (void *)[v31 copy];
  [v4 setTrailingBottomText:v32];

  uint64_t v33 = [(SFDetailedRowCardSection *)self action];
  uint64_t v34 = (void *)[v33 copy];
  [v4 setAction:v34];

  BOOL v35 = [(SFDetailedRowCardSection *)self button];
  uint64_t v36 = (void *)[v35 copy];
  [v4 setButton:v36];

  objc_msgSend(v4, "setShouldUseCompactDisplay:", -[SFDetailedRowCardSection shouldUseCompactDisplay](self, "shouldUseCompactDisplay"));
  v37 = [(SFDetailedRowCardSection *)self buttonItems];
  uint64_t v38 = (void *)[v37 copy];
  [v4 setButtonItems:v38];

  v39 = [(SFDetailedRowCardSection *)self trailingThumbnail];
  uint64_t v40 = (void *)[v39 copy];
  [v4 setTrailingThumbnail:v40];

  objc_msgSend(v4, "setButtonItemsAreTrailing:", -[SFDetailedRowCardSection buttonItemsAreTrailing](self, "buttonItemsAreTrailing"));
  v41 = [(SFDetailedRowCardSection *)self topText];
  BOOL v42 = (void *)[v41 copy];
  [v4 setTopText:v42];

  uint64_t v43 = [(SFDetailedRowCardSection *)self richTrailingTopText];
  v44 = (void *)[v43 copy];
  [v4 setRichTrailingTopText:v44];

  uint64_t v45 = [(SFDetailedRowCardSection *)self richTrailingMiddleText];
  v46 = (void *)[v45 copy];
  [v4 setRichTrailingMiddleText:v46];

  uint64_t v47 = [(SFDetailedRowCardSection *)self richTrailingBottomText];
  v48 = (void *)[v47 copy];
  [v4 setRichTrailingBottomText:v48];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBDetailedRowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBDetailedRowCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBDetailedRowCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBDetailedRowCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFDetailedRowCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFDetailedRowCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  unint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    uint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    int v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    int v12 = [(SFCardSection *)v8 type];
    [(SFDetailedRowCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    int v14 = [(SFCardSection *)v8 thumbnail];
    [(SFDetailedRowCardSection *)v5 setThumbnail:v14];

    [(SFDetailedRowCardSection *)v5 setPreventThumbnailImageScaling:[(SFCardSection *)v8 preventThumbnailImageScaling]];
    int v15 = [(SFCardSection *)v8 title];
    [(SFDetailedRowCardSection *)v5 setTitle:v15];

    char v16 = [(SFCardSection *)v8 secondaryTitle];
    [(SFDetailedRowCardSection *)v5 setSecondaryTitle:v16];

    uint64_t v17 = [(SFCardSection *)v8 secondaryTitleImage];
    [(SFDetailedRowCardSection *)v5 setSecondaryTitleImage:v17];

    [(SFDetailedRowCardSection *)v5 setIsSecondaryTitleDetached:[(SFCardSection *)v8 isSecondaryTitleDetached]];
    int v18 = [(SFCardSection *)v8 descriptions];
    [(SFDetailedRowCardSection *)v5 setDescriptions:v18];

    int v19 = [(SFCardSection *)v8 footnote];
    [(SFDetailedRowCardSection *)v5 setFootnote:v19];

    uint64_t v20 = [(SFCardSection *)v8 trailingTopText];
    [(SFDetailedRowCardSection *)v5 setTrailingTopText:v20];

    int v21 = [(SFCardSection *)v8 trailingMiddleText];
    [(SFDetailedRowCardSection *)v5 setTrailingMiddleText:v21];

    int v22 = [(SFCardSection *)v8 trailingBottomText];
    [(SFDetailedRowCardSection *)v5 setTrailingBottomText:v22];

    uint64_t v23 = [(SFCardSection *)v8 action];
    [(SFDetailedRowCardSection *)v5 setAction:v23];

    uint64_t v24 = [(SFCardSection *)v8 button];
    [(SFDetailedRowCardSection *)v5 setButton:v24];

    [(SFDetailedRowCardSection *)v5 setShouldUseCompactDisplay:[(SFCardSection *)v8 shouldUseCompactDisplay]];
    BOOL v25 = [(SFCardSection *)v8 buttonItems];
    [(SFDetailedRowCardSection *)v5 setButtonItems:v25];

    BOOL v26 = [(SFCardSection *)v8 trailingThumbnail];
    [(SFDetailedRowCardSection *)v5 setTrailingThumbnail:v26];

    [(SFDetailedRowCardSection *)v5 setButtonItemsAreTrailing:[(SFCardSection *)v8 buttonItemsAreTrailing]];
    BOOL v27 = [(SFCardSection *)v8 topText];
    [(SFDetailedRowCardSection *)v5 setTopText:v27];

    uint64_t v28 = [(SFCardSection *)v8 richTrailingTopText];
    [(SFDetailedRowCardSection *)v5 setRichTrailingTopText:v28];

    BOOL v29 = [(SFCardSection *)v8 richTrailingMiddleText];
    [(SFDetailedRowCardSection *)v5 setRichTrailingMiddleText:v29];

    int v30 = [(SFCardSection *)v8 richTrailingBottomText];
    [(SFDetailedRowCardSection *)v5 setRichTrailingBottomText:v30];

    uint64_t v31 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v31];

    uint64_t v32 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v32];

    uint64_t v33 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v33];

    uint64_t v34 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v34];

    BOOL v35 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v35];

    uint64_t v36 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v36];

    v37 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v37];

    uint64_t v38 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v38];

    v39 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v39];

    uint64_t v40 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v40];

    v41 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v41];

    BOOL v42 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v42];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    uint64_t v43 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v43];

    v44 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v44];

    uint64_t v45 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v45];

    v46 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v46];

    uint64_t v47 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v47];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v48 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v48];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v49 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v49];

    objc_super v50 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v50];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    uint64_t v51 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v51];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasButtonItemsAreTrailing
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setButtonItemsAreTrailing:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_buttonItemsAreTrailing = a3;
}

- (BOOL)hasShouldUseCompactDisplay
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setShouldUseCompactDisplay:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_shouldUseCompactDisplay = a3;
}

- (BOOL)hasIsSecondaryTitleDetached
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsSecondaryTitleDetached:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isSecondaryTitleDetached = a3;
}

- (BOOL)hasPreventThumbnailImageScaling
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPreventThumbnailImageScaling:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_preventThumbnailImageScaling = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFDetailedRowCardSection)initWithProtobuf:(id)a3
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v116.receiver = self;
  v116.super_class = (Class)SFDetailedRowCardSection;
  uint64_t v5 = [(SFCardSection *)&v116 init];

  if (v5)
  {
    uint64_t v6 = [v4 punchoutOptions];
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v7 = 0;
    }

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    unint64_t v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v112 objects:v119 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v113 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v112 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v112 objects:v119 count:16];
      }
      while (v10);
    }

    [(SFCardSection *)v5 setPunchoutOptions:v7];
    int v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      int v15 = [v4 punchoutPickerTitle];
      [(SFCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    char v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      uint64_t v17 = [v4 punchoutPickerDismissText];
      [(SFCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 canBeHidden]) {
      -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasTopPadding]) {
      -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasBottomPadding]) {
      -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    int v18 = [v4 type];

    if (v18)
    {
      int v19 = [v4 type];
      [(SFDetailedRowCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    uint64_t v20 = [v4 backgroundColor];

    if (v20)
    {
      int v21 = [SFColor alloc];
      int v22 = [v4 backgroundColor];
      uint64_t v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    uint64_t v24 = [v4 thumbnail];

    if (v24)
    {
      BOOL v25 = [SFImage alloc];
      BOOL v26 = [v4 thumbnail];
      BOOL v27 = [(SFImage *)v25 initWithProtobuf:v26];
      [(SFDetailedRowCardSection *)v5 setThumbnail:v27];
    }
    if ([v4 preventThumbnailImageScaling]) {
      -[SFDetailedRowCardSection setPreventThumbnailImageScaling:](v5, "setPreventThumbnailImageScaling:", [v4 preventThumbnailImageScaling]);
    }
    uint64_t v28 = [v4 title];

    if (v28)
    {
      BOOL v29 = [SFRichText alloc];
      int v30 = [v4 title];
      uint64_t v31 = [(SFRichText *)v29 initWithProtobuf:v30];
      [(SFDetailedRowCardSection *)v5 setTitle:v31];
    }
    uint64_t v32 = [v4 secondaryTitle];

    if (v32)
    {
      uint64_t v33 = [SFFormattedText alloc];
      uint64_t v34 = [v4 secondaryTitle];
      BOOL v35 = [(SFFormattedText *)v33 initWithProtobuf:v34];
      [(SFDetailedRowCardSection *)v5 setSecondaryTitle:v35];
    }
    uint64_t v36 = [v4 secondaryTitleImage];

    if (v36)
    {
      v37 = [SFImage alloc];
      uint64_t v38 = [v4 secondaryTitleImage];
      v39 = [(SFImage *)v37 initWithProtobuf:v38];
      [(SFDetailedRowCardSection *)v5 setSecondaryTitleImage:v39];
    }
    if ([v4 isSecondaryTitleDetached]) {
      -[SFDetailedRowCardSection setIsSecondaryTitleDetached:](v5, "setIsSecondaryTitleDetached:", [v4 isSecondaryTitleDetached]);
    }
    uint64_t v40 = [v4 descriptions];
    v103 = v5;
    if (v40)
    {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v41 = 0;
    }

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    BOOL v42 = [v4 descriptions];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v108 objects:v118 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v109;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v109 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = [[SFRichText alloc] initWithProtobuf:*(void *)(*((void *)&v108 + 1) + 8 * j)];
          if (v47) {
            [v41 addObject:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v108 objects:v118 count:16];
      }
      while (v44);
    }

    [(SFDetailedRowCardSection *)v103 setDescriptions:v41];
    v48 = [v4 footnote];

    if (v48)
    {
      uint64_t v49 = [SFRichText alloc];
      objc_super v50 = [v4 footnote];
      uint64_t v51 = [(SFRichText *)v49 initWithProtobuf:v50];
      [(SFDetailedRowCardSection *)v103 setFootnote:v51];
    }
    v52 = [v4 trailingTopText];

    if (v52)
    {
      uint64_t v53 = [SFFormattedText alloc];
      v54 = [v4 trailingTopText];
      uint64_t v55 = [(SFFormattedText *)v53 initWithProtobuf:v54];
      [(SFDetailedRowCardSection *)v103 setTrailingTopText:v55];
    }
    v56 = [v4 trailingMiddleText];

    if (v56)
    {
      BOOL v57 = [SFFormattedText alloc];
      uint64_t v58 = [v4 trailingMiddleText];
      v59 = [(SFFormattedText *)v57 initWithProtobuf:v58];
      [(SFDetailedRowCardSection *)v103 setTrailingMiddleText:v59];
    }
    uint64_t v60 = [v4 trailingBottomText];

    if (v60)
    {
      v61 = [SFFormattedText alloc];
      BOOL v62 = [v4 trailingBottomText];
      uint64_t v63 = [(SFFormattedText *)v61 initWithProtobuf:v62];
      [(SFDetailedRowCardSection *)v103 setTrailingBottomText:v63];
    }
    v64 = [v4 action];

    if (v64)
    {
      uint64_t v65 = [SFActionItem alloc];
      v66 = [v4 action];
      uint64_t v67 = [(SFActionItem *)v65 initWithProtobuf:v66];
      [(SFDetailedRowCardSection *)v103 setAction:v67];
    }
    v68 = [v4 button];

    if (v68)
    {
      v69 = [SFButton alloc];
      v70 = [v4 button];
      v71 = [(SFButton *)v69 initWithProtobuf:v70];
      [(SFDetailedRowCardSection *)v103 setButton:v71];
    }
    if ([v4 shouldUseCompactDisplay]) {
      -[SFDetailedRowCardSection setShouldUseCompactDisplay:](v103, "setShouldUseCompactDisplay:", [v4 shouldUseCompactDisplay]);
    }
    v72 = [v4 buttonItems];
    if (v72)
    {
      id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v73 = 0;
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    v102 = v4;
    v74 = [v4 buttonItems];
    uint64_t v75 = [v74 countByEnumeratingWithState:&v104 objects:v117 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v105;
      do
      {
        for (uint64_t k = 0; k != v76; ++k)
        {
          if (*(void *)v105 != v77) {
            objc_enumerationMutation(v74);
          }
          v79 = [[SFButtonItem alloc] initWithProtobuf:*(void *)(*((void *)&v104 + 1) + 8 * k)];
          if (v79) {
            [v73 addObject:v79];
          }
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v104 objects:v117 count:16];
      }
      while (v76);
    }

    uint64_t v5 = v103;
    [(SFDetailedRowCardSection *)v103 setButtonItems:v73];
    id v4 = v102;
    v80 = [v102 trailingThumbnail];

    if (v80)
    {
      v81 = [SFImage alloc];
      v82 = [v102 trailingThumbnail];
      v83 = [(SFImage *)v81 initWithProtobuf:v82];
      [(SFDetailedRowCardSection *)v103 setTrailingThumbnail:v83];
    }
    if ([v102 buttonItemsAreTrailing]) {
      -[SFDetailedRowCardSection setButtonItemsAreTrailing:](v103, "setButtonItemsAreTrailing:", [v102 buttonItemsAreTrailing]);
    }
    v84 = [v102 topText];

    if (v84)
    {
      v85 = [SFRichText alloc];
      v86 = [v102 topText];
      v87 = [(SFRichText *)v85 initWithProtobuf:v86];
      [(SFDetailedRowCardSection *)v103 setTopText:v87];
    }
    v88 = [v102 richTrailingTopText];

    if (v88)
    {
      v89 = [SFRichText alloc];
      v90 = [v102 richTrailingTopText];
      v91 = [(SFRichText *)v89 initWithProtobuf:v90];
      [(SFDetailedRowCardSection *)v103 setRichTrailingTopText:v91];
    }
    v92 = [v102 richTrailingMiddleText];

    if (v92)
    {
      v93 = [SFRichText alloc];
      v94 = [v102 richTrailingMiddleText];
      v95 = [(SFRichText *)v93 initWithProtobuf:v94];
      [(SFDetailedRowCardSection *)v103 setRichTrailingMiddleText:v95];
    }
    v96 = [v102 richTrailingBottomText];

    if (v96)
    {
      v97 = [SFRichText alloc];
      v98 = [v102 richTrailingBottomText];
      v99 = [(SFRichText *)v97 initWithProtobuf:v98];
      [(SFDetailedRowCardSection *)v103 setRichTrailingBottomText:v99];
    }
    v100 = v103;
  }
  return v5;
}

@end