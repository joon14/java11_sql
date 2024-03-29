package org.kh.dto;

public class Book {
	private int bookid;
	private String bookind;
	private String booktitle;
	private int bookprice;
	private int bookcount;
	private String author;
	private String pubcom;
	private String pubdate;
	
	public Book() {}
	public Book(int bookid, String bookind, String booktitle, int bookprice, int bookcount, String author,
			String pubcom, String pubdate) {
		super();
		this.bookid = bookid;
		this.bookind = bookind;
		this.booktitle = booktitle;
		this.bookprice = bookprice;
		this.bookcount = bookcount;
		this.author = author;
		this.pubcom = pubcom;
		this.pubdate = pubdate;
	}
	
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookind() {
		return bookind;
	}
	public void setBookind(String bookind) {
		this.bookind = bookind;
	}
	public String getBooktitle() {
		return booktitle;
	}
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	public int getBookprice() {
		return bookprice;
	}
	public void setBookprice(int bookprice) {
		this.bookprice = bookprice;
	}
	public int getBookcount() {
		return bookcount;
	}
	public void setBookcount(int bookcount) {
		this.bookcount = bookcount;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPubcom() {
		return pubcom;
	}
	public void setPubcom(String pubcom) {
		this.pubcom = pubcom;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	
	@Override
	public String toString() {
		return "Book [bookid=" + bookid + ", bookind=" + bookind + ", booktitle=" + booktitle + ", bookprice="
				+ bookprice + ", bookcount=" + bookcount + ", author=" + author + ", pubcom=" + pubcom + ", pubdate="
				+ pubdate + "]";
	}
}
